class AddDescription < ActiveRecord::Migration
  def change   
    add_column :brothers, :description, :string
  end
end
