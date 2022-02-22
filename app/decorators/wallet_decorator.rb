class WalletDecorator < Draper::Decorator
  decorates_association :transactions
  delegate_all

  def balance_in_eth
    if self.balance.present?
      (self.balance / 1000000000000000000).round(3).to_s + "ETH"
    else
      "IN PROGRESS"
    end
  end
end
