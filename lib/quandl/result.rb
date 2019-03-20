require_relative './../utils'
require_relative './rate_of_return'
require_relative './draw_down'

module Quandl
  # Represents a result from the Quandl API
  class Result
    include Utils

    # Struct will be used to split the data from the Quandl API

    Row = Struct.new(
      :ticker,
      :date,
      :open,
      :high,
      :low,
      :close,
      :volume,
      :ex_dividend,
      :split_ratio,
      :adj_open,
      :adj_high,
      :adj_low,
      :adj_close,
      :adj_volume,
      :draw_down
    )

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
      rate.rate_of_return
    end

    def print_max_drawdown
      Quandl::DrawDown.max_drawdown(response)
    end

    def print_first_n_drawdown
      Quandl::DrawDown.first_n_drawdown(response)
    end

    private

    def parsed_response(response)
      parsed_result = []
      response['datatable']['data'].reverse_each do |data|
        stock_data = process_rows(data)
        parsed_result << stock_data
      end

      parsed_result
    end

    def process_rows(data)
      stock = Quandl::Result::Row.new(*data)
      stock[:draw_down] = calculate_drawdown(stock.high, stock.low)
      stock
    end

    def format_closing_data(price_data)
      date = format_date(price_data.date)
      "#{date}: Closed at #{round_of_price(price_data.close)}" \
      " (#{round_of_price(price_data.low)} ~" \
      " #{round_of_price(price_data.high)})\n"
    end
  end
end
