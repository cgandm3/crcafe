class RenameMyTable < ActiveRecord::Migration
  def change
    rename_table :caves, :cafes
  end
end
