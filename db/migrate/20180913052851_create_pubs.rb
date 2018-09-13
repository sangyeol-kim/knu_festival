class CreatePubs < ActiveRecord::Migration[5.1]
  def change
    create_table :pubs do |t|
      t.string :title
      t.text :content
      t.text :modal
      t.string :image

      t.timestamps
    end
  end
end
