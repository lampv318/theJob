class QsearchController < ApplicationController
  attr_reader :basics
  attr_reader :users

  def search
    @basics = BasicInfo.ransack(full_name_cont: params[:q]).result distin: true
    @users = User.ransack(email_cont: params[:q]).result distin: true
    respond_to do |format|
      format.json{basics}
      format.json{user}
    end
  end

end
