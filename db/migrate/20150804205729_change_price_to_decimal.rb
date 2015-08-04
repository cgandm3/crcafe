class ChangePriceToDecimal < ActiveRecord::Migration
  def change
  	change_column :cafes, :price, :decimal, precision: 7, scale: 2
  end
end
