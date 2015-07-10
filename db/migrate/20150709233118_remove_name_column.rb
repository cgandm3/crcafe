class RemoveNameColumn < ActiveRecord::Migration
  def change
  	remove_column :cafes, :name
  end
end
