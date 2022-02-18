module WalletsHelper
  def wallets_balance
    client = Etherscan::V1::Client.new
    (client.get_balance(address: @wallet.address)["result"].to_d / 1000000000000000000).round(3)
  end
end
