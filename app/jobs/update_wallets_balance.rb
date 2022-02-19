class UpdateWalletsBalance < ApplicationJob
  queue_as :default

  def perform address:
    client = Etherscan::V1::Client.new
    wallet = Wallet.find_by_address address
    wallet.update balance: (client.get_balance(address: address)["result"].to_d / 1000000000000000000).round(3)
  end

end
