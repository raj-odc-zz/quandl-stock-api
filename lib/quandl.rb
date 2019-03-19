module Quandl
  extend self 

  require 'httparty'
  require 'pry'
  require_relative 'quandl/api/v3/client'

  def get_api_data(params)
    api_response = Quandl::Api::V3::Client.request_api(params)
  end

end