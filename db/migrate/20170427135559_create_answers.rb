class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :ticket_id
      t.string :author
      t.string :body
      t.datetime "created_at",                null: false
      t.datetime "updated_at",                null: false
    end
  end
end
