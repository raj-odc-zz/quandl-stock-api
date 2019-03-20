module Quandl
  module Api
    module V3
      # Calling Quandl API for getting the stock information
      # V3 denotes the api version
      class Client
        class << self
          API_ENDPOINT = 'https://www.quandl.com/api/v3/datatables/WIKI/PRICES.json?'.freeze

          def request_api(params = nil)
            raise 'params should not be empty' unless params

            response = HTTParty.get(build_url(params))
            return response if response.success?

            raise 'Api error', "Code: #{response.code}, response: #{response}"
          end

          private

          def build_url(params)
            query_string = URI.encode_www_form(params)
            API_ENDPOINT + query_string
          end
        end
      end
    end
  end
end
