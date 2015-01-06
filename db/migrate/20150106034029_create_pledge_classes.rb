class CreatePledgeClasses < ActiveRecord::Migration
  def change
    create_table :pledge_classes do |t|
      t.string :name
      t.date :pledge_semester
      t.references :brothers
      t.references :professional_event
      t.timestamps null: false
    end
  end
end
