class UpdateWalletsOnchainDataJob < ApplicationJob
  queue_as :default

  def perform *args
    puts "hello"
  end
end
