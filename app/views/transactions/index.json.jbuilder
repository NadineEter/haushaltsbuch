json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :amount, :date, :comment, :account_id, :income, :category_id
  json.url transaction_url(transaction, format: :json)
end
