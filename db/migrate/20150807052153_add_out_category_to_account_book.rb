class AddOutCategoryToAccountBook < ActiveRecord::Migration
  def change
    add_column :account_books, :out_category_id, :integer, after: :money
    add_column :account_books, :in_category_id, :integer, after: :out_category_id
  end
end
