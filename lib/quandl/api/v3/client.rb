module Quandl
  module Api
    module V3
      # Calling Quandl API for getting the stock information
      # V3 denotes the api version in case feature if new version comes we can use the V4 like that
      class Client

        API_ENDPOINT = 'https://www.quandl.com/api/v3/datatables/WIKI/PRICES.json?'.freeze

        def self.request_api(params=nil)
          raise 'params should not be empty' unless params

          response = HTTParty.get(self.build_url(params))
          return response if response.success?

          raise 'Api error', "Code: #{response.code}, response: #{response}"
        end

        def self.build_url(params)
          query_string = URI.encode_www_form(params)
          API_ENDPOINT + query_string
        end      
        
      end
    end
  end
end