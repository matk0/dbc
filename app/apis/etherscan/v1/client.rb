module Etherscan
  module V1
    class Client

      def initialize
      end

      def get_balance address: 
        request(
          http_method: :get,
          endpoint: "api",
          params: { module: "account",
                    action: "balance",
                    address: address,
                    tag: "latest",
                    apikey: Rails.application.credentials.etherscan[:api_key_token]}
        )
      end

      def get_transactions address:
        request(
          http_method: :get,
          endpoint: "api",
          params: { module: "account",
                    action: "txlist",
                    address: address,
                    startblock: 0,
                    endblock: 99999999,
                    page: 1,
                    offset: 10,
                    sort: 10,
                    apikey: Rails.application.credentials.etherscan[:api_key_token]}
        )
      end

      private

      def client
        @_client ||= Faraday.new("https://api.etherscan.io") do |client|
          client.request :url_encoded
          client.adapter Faraday.default_adapter
        end
      end



      def request(http_method:, endpoint:, params: {})
        response = client.public_send(http_method, endpoint, params)
        Oj.load(response.body)
      end

    end
  end
end
