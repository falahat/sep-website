class CreateBrothers < ActiveRecord::Migration
  def change
    create_table :brothers do |t|
    	t.string :name
    	t.string :pledge_class
    	t.date :grad_year

    	t.references :jobs
    	t.references :companies

     	t.timestamps null: false
    end
  end
end
