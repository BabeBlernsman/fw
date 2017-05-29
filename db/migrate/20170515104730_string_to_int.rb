class StringToInt < ActiveRecord::Migration
  def change
    change_column :answers, :author, :integer
  end
end
