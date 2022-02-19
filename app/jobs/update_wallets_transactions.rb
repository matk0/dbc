class UpdateWalletsTransactions < ApplicationJob
  queue_as :default

  def perform address:
    client = Etherscan::V1::Client.new
    txs = client.get_transactions(address: address)["result"]
    txs.each do |tx|
      Transaction.create on_chain_attrs: tx, wallet: Wallet.find_by_address(address)
    end
  end
end
