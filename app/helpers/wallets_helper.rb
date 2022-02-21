module WalletsHelper
  def wallets_transactions

    if @wallet.transactions.any?
      table columns: ["from", "to"], rows: @wallet.transactions

    else
      "IN PROGRESS OR NO TRANSACTIONS"
    end
      # content_tag(:table, class: "table table-striped") do
      #   content_tag(:tbody) do
      #     concat @wallet.transactions.collect do |tx|
      #       content_tag(:tr) do
      #         content_tag(:td) do
      #           "hello"
      #         end
      #       end
      #     end
      #   end
      # end

      #     concat content_tag(:a, href: transaction_path(tx))
      #       content_tag(:li, tx.on_chain_attrs["from"]) do
      #     end
      #   end
      # end
  end
end
