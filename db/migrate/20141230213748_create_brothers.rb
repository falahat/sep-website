class CreateBrothers < ActiveRecord::Migration
  def change
    create_table :brothers do |t|
    	t.string :name
    	t.date :grad_year
    	t.text :description
      t.string :major
      t.string :image_url

    	t.references :jobs
      t.references :pledge_class
      t.references :ventures

     	t.timestamps null: false
    end
  end
end
