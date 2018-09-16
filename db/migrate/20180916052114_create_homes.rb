class CreateHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :homes do |t|
      t.integer :count_view, default: 0
      t.timestamps
    end
  end
end
