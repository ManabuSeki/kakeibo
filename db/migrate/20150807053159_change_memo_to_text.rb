class ChangeMemoToText < ActiveRecord::Migration
  def change
    change_column :account_books, :memo, :text
  end
end
