class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
   	  t.string :image_url
   	  t.text :text
   	  t.string :author
   	  t.string :author_role
   	  t.inet :verticle_alignment
      t.timestamps null: false
    end
  end
end
