class UserContactsController < ApplicationController

  def create
    @message = Message.new message_params
    if @message.save
      UserMailer.contact_user(@message).deliver_now
      flash[:success] = "send to #{@message.user.email} successfully"
      redirect_to resumes_path
    else
      flash[:danger] = "some thing went wrong"
      redirect_to root_path
    end
  end

  private 

  def message_params
    params.require(:message).permit :user_id, :subject, :message
  end
end
