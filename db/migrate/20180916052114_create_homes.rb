class CreateHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :homes do |t|
      t.integer :count_view, default: "404"
      t.timestamps
    end
  end
end
