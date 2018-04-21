class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :headline
      t.string :description
      t.string :location
      t.integer :employee
      t.string :website
      t.integer :founder
      t.integer :phone
      t.string :email
      t.string :avatar
      t.string :cover_image

      t.timestamps
    end
  end
end
