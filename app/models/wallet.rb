class Wallet < ApplicationRecord
  has_many :transactions
  validates_uniqueness_of :address
end
