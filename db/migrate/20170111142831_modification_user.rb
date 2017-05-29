class ModificationUser < ActiveRecord::Migration
  def change
    rename_column :tickets, :assigned, :status
    change_column :tickets, :status,  :integer, default: 0
  end
end
