class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :lost, foreign_key: true
      t.string :lost_id

      t.timestamps
    end
  end
end
