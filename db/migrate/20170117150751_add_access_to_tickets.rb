class AddAccessToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :access, :integer, default: 0
  end
end
