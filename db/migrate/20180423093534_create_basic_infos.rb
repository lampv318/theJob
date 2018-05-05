class CreateBasicInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :basic_infos do |t|
      t.integer :resume_id
      t.integer :user_id
      t.string :user_avatar
      t.string :link_avatar
      t.string :full_name
      t.string :headline
      t.string :description
      t.string :location
      t.string :website
      t.integer :salary
      t.integer :age
      t.string :phone
      t.string :email_address

      t.timestamps
    end
  end
end
