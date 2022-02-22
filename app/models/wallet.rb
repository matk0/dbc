class Wallet < ApplicationRecord
  has_many :transactions, dependent: :destroy
  validates_uniqueness_of :address
end
