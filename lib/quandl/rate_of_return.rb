require_relative './../utils'

module Quandl
  # Represents a result from the Quandl API
  class RateOfReturn

    include Utils

    attr_reader :response

    def initialize(response)
    	@response = response
    end

    def get_formatted_string
    	format_rate_of_return
    end

    private

    def format_rate_of_return
    	first_stock = response.first
    	last_stock = response.last 
			start_price = first_stock.close.to_f
			end_price = last_stock.close.to_f
	  	return_amount, return_percentage = calculate_rate_of_return(start_price, end_price)

	   	"Return: #{return_amount} [#{return_percentage}] (#{start_price} on #{format_date(first_stock.date)} -> #{end_price} on #{format_date(last_stock.date)})"
		end

		def calculate_rate_of_return(start_value, end_value)
			diff = (end_value - start_value)
	    per_diff = format_percentage_value(diff / start_value)
	    symbol = per_diff > 0 ? '+' : ''
	    [diff, "#{symbol}#{per_diff}%"]
	  end
  end
end