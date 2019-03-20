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
    	output = "\n"
  		output += format_rate_of_return
  		output += "\n"
    end

    private

    def format_rate_of_return
			start_price = response.first.close.to_f
			end_price = response.last.close.to_f
			start_date = response.first.date
			end_date = response.last.date
	  	return_amount, return_percentage = calculate_rate_of_return(start_price, end_price)
	  	symbol = return_percentage > 0 ? '+' : ''

	   	"Return: #{return_amount} [#{symbol}#{return_percentage}%] (#{start_price} on #{format_date(start_date)} -> #{end_price} on #{format_date(end_date)})"
		end

		def calculate_rate_of_return(start_value, end_value)
			diff = (end_value - start_value)
	    per_diff = format_percentage_value(diff / start_value)
	    [diff, per_diff]
	  end
  end
end