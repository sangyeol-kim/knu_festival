class AddPasswordToLost < ActiveRecord::Migration[5.1]
  def change
    add_column :losts, :password, :string
  end
end
