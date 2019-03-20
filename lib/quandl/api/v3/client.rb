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

            result = HTTParty.get(build_url(params))

            print_result(result)
          end

          private

          def build_url(params)
            query_string = URI.encode_www_form(params)
            API_ENDPOINT + query_string
          end

          def print_result(result)
            raise result['quandl_error']['message'] if result['quandl_error']

            raise 'Data not found' if result.success? && result['datatable']['data'].empty?

            result
          end
        end
      end
    end
  end
end
