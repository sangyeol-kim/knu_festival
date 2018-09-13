class CreateHuntings < ActiveRecord::Migration[5.1]
  def change
    create_table :huntings do |t|
      t.string :title
      t.text :content
      t.string :writer
      t.text :pw

      t.timestamps
    end
  end
end
