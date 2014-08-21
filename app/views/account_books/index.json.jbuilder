json.array!(@account_books) do |account_book|
  json.extract! account_book, :id, :date, :category, :money, :description, :out, :in, :memo, :status
  json.url account_book_url(account_book, format: :json)
end
