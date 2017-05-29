class RenameColumnInTickets < ActiveRecord::Migration
  def change
    rename_column :tickets, :status, :assign_status
  end
end
