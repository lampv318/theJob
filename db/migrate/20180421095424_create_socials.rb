class CreateSocials < ActiveRecord::Migration[5.1]
  def change
    create_table :socials do |t|
      t.integer :resume_id
      t.string :facebook_link
      t.string :google_link
      t.string :twitter_link
      t.string :github_link
      t.string :instagram_link

      t.timestamps
    end
  end
end
