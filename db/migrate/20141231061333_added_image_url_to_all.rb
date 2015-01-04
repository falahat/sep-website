class AddedImageUrlToAll < ActiveRecord::Migration
  def change
  	add_column :brothers, :image_url, :string
  	add_column :companies, :image_url, :string

  end
end
