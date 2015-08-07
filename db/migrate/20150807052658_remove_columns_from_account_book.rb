class RemoveColumnsFromAccountBook < ActiveRecord::Migration
  def change
    remove_column :account_books, :out, :string
    remove_column :account_books, :in, :string
    remove_column :account_books, :status, :string
    remove_column :account_books, :description, :string
  end
end
