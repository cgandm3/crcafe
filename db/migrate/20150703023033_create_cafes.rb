class CreateCafes < ActiveRecord::Migration
  def change
    create_table :cafes do |t|
      t.string :desc
      t.string :feature
      t.string :mimg
      t.string :limg
      t.string :fprice
      t.integer :price

      t.timestamps null: false
    end
  end
end