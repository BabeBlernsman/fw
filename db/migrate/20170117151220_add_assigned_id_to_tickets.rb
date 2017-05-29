class AddAssignedIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :assigned_id, :integer
  end
end
