require_relative './../utils'
require_relative './rate_of_return'

module Quandl
  # Represents a result from the Quandl API
  class Result

    include Utils

    Row = Struct.new(:ticker, :date, :open, :high, :low, :close, :volume, :ex_dividend, :split_ratio, :adj_open, :adj_high, :adj_low, :adj_close, :adj_volume, :draw_down)

    attr_reader :response
    def initialize(response)
      @response = parsed_response(response)
    end

    def print_closing_prices
      output = "\n"
      response.each { |price_data| output += format_closing_data(price_data) }
      output += "\n"
    end

    def print_rate_of_return
      rate = Quandl::RateOfReturn.new(response)
      rate.get_formatted_string
    end

    private

    def parsed_response(response)
      parsed_result = []
      if response && response['datatable'] && response['datatable']['data'] 
        response['datatable']['data'].reverse.each do |data|
          parsed_object = Quandl::Result::Row.new(*data)
          parsed_object[:draw_down] = calculate_drawdown(parsed_object.high, parsed_object.low)
          parsed_result << parsed_object
        end
      end

      parsed_result
    end

    def format_closing_data(price_data)
      date = format_date(price_data.date)
      "#{date}: Closed at #{round_of_price(price_data.close)} (#{round_of_price(price_data.low)} ~ #{round_of_price(price_data.high)})\n"
    end
  end
end
