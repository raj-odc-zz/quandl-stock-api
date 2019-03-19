module Utils
	def format_date(date_string)
    Date.parse(date_string).strftime("%d.%m.%y")
  end

  def calculate_rate_of_return(start_value, end_value)
    (end_value - start_value) / start_value
  end

  def format_percentage_value(rate)
    (rate * 100).round(1)
  end

  def round_of_price(price)
    price.round(2)
  end

  def calculate_drawdown(high, low)
    (((high-low)/high)*100).round(1)
  end
end