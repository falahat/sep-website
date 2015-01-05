class AddedMajorToBrothers < ActiveRecord::Migration
  def change
  	add_column :brothers, :major, :string
  	add_column :brothers, :minor, :string
  end
end
