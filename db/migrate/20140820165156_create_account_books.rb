class CreateAccountBooks < ActiveRecord::Migration
  def change
    create_table :account_books do |t|
      t.date :date
      t.integer :category
      t.integer :money
      t.string :description
      t.string :out
      t.string :in
      t.string :memo
      t.string :status

      t.timestamps
    end
  end
end
