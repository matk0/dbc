json.extract! transaction, :id, :on_chain_attrs, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
