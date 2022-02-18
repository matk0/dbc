module WalletsHelper
  def wallets_balance
    client = Etherscan::V1::Client.new
    (client.get_balance(address: @wallet.address)["result"].to_d / 1000000000000000000).round(3)
  end

  def wallets_transactions
    client = Etherscan::V1::Client.new
    txs = client.get_transactions(address: @wallet.address)["result"]
    content_tag(:ul) do
      txs.map do |tx|
        concat content_tag(:li, tx["from"], class: "example")
      end
    end
  end
end
