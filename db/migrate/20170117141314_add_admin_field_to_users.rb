class AddAdminFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_lvl, :integer, default: 0
  end
end
