class CreateRushEvents < ActiveRecord::Migration
  def change
    create_table :rush_events do |t|
      t.string :name
      t.string :attire
      t.text :description
      t.string :subtitle
      t.date :time
      t.string :location
      t.timestamps null: false
    end
  end
end
