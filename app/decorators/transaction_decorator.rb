class TransactionDecorator < Draper::Decorator
  delegate_all

  def display_name_from
    from = self.on_chain_attrs["from"]
    wallets = Wallet.where 'lower(address) = ?', from
    if wallets.any?
      wallets[0].name
    else
      from
    end
  end

  def display_name_to
    to = self.on_chain_attrs["to"]
    wallets = Wallet.where 'lower(address) = ?', to
    if wallets.any?
      wallets[0].name
    else
      to
    end
  end

  def display_value
    (self.on_chain_attrs["value"].to_d / 1000000000000000000).round(3).to_s + "ETH"
  end

  def display_date
    # DateTime.parse(self.on_chain_attrs["timeStamp"]).strftime("%m/%d/%Y")
  end
end
