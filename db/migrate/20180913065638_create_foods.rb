class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :title
      t.text :menu
      t.string :image
      t.integer :number
      t.string :ps
      t.integer :iconid
      t.integer :randicon
      
      t.timestamps
    end
  end
end
