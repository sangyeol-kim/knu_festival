class CreateLosts < ActiveRecord::Migration[5.1]
  def change
    create_table :losts do |t|
      t.string :title
      t.text :content
      t.string :image
      t.integer :password

      t.timestamps
    end
  end
end
