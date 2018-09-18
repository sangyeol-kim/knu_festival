class AddPsToFleamarket < ActiveRecord::Migration[5.1]
  def change
    add_column :fleamarkets, :ps, :string
  end
end
