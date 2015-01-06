class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string :role
    	t.text :description
    	t.date :start
    	t.date :end 


    	t.references :brother
      t.references :companies

     	t.timestamps null: false
    end
  end
end
