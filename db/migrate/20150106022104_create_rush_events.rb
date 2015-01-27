class CreateRushEvents < ActiveRecord::Migration
  def change
    create_table :rush_events do |t|
      t.string :name
      t.string :attire
      t.text :description
      t.string :date
      t.string :subtitle
      t.string :time
      t.string :location
      t.timestamps null: false
    end
  end
end
