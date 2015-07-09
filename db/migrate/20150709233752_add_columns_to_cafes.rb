class AddColumnsToCafes < ActiveRecord::Migration
  def change
  	add_column :cafes, :desc, :string
  	add_column :cafes, :feature, :string
  	add_column :cafes, :mimg, :string  
  	add_column :cafes, :limg, :string 
  	add_column :cafes, :fprice, :string 
  	add_column :cafes, :price, :integer
  end
end
