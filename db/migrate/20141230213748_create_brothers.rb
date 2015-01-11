class CreateBrothers < ActiveRecord::Migration
  def change
    create_table :brothers do |t|
      t.string :role
    	t.string :name
    	t.date :grad_year
    	t.text :description
      t.string :major
      t.string :image_url
      t.boolean :active
    	t.references :jobs
      t.references :pledge_class
      t.string :note

     	t.timestamps null: false
    end
  end
end
