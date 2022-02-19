module WalletsHelper
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
