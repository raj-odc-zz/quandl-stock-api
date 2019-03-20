module Quandl
  extend self 

  require 'httparty'
  require 'pry'
  require_relative 'quandl/api/v3/client'
  require_relative 'quandl/result'

  def get_api_data(params)
    Quandl::Api::V3::Client.request_api(params)
  end

end