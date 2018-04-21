class CreateCompanyDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :company_details do |t|
      t.integer :company_id
      t.text :content

      t.timestamps
    end
  end
end
