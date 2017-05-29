class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :body
      t.boolean :assigned, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
