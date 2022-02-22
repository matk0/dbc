module WalletsHelper
  def wallets_transactions

    if @wallet.transactions.any?
      table columns: ["From", "To", "Value", "Date"], rows: @wallet.transactions.map{|tx| [tx.display_name_from, tx.display_name_to, tx.display_value, tx.display_date]}
    else
      "IN PROGRESS OR NO TRANSACTIONS"
    end
  end
end
