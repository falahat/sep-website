class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
    	t.string :name
    	t.text :description
    	t.string :logo_url
    	t.boolean :isVenture
    	t.references :brothers

      t.timestamps null: false
    end
  end
end
