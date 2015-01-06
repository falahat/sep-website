class CreateProfessionalEvents < ActiveRecord::Migration
  def change
    create_table :professional_events do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.references :pledge_class
      t.timestamps null: false
    end
  end
end
