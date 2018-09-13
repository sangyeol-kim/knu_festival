class CreateFleamarkets < ActiveRecord::Migration[5.1]
  def change
    create_table :fleamarkets do |t|
      t.string :title
      t.text :content
      t.text :modal
      t.string :image

      t.timestamps
    end
  end
end
