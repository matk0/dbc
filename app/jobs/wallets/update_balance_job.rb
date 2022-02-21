class Wallets::UpdateBalanceJob < ApplicationJob
  queue_as :default

  def perform address:
    client = Etherscan::V1::Client.new
    balance = client.get_balance(address: address)["result"].to_d
    wallet = Wallet.find_by_address address
    wallet.update balance: balance
  end

end
