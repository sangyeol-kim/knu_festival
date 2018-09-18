class AddFdidToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fdid, :integer
    add_column :users, :areaid, :integer
  end
end
