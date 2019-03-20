# Helper used to define some common methods to reuse in the project
module Utils
  def format_date(date_string)
    Date.parse(date_string).strftime('%d.%m.%y')
  end

  def format_percentage_value(rate)
    (rate * 100).round(1)
  end

  def round_of_price(price)
    price.round(2)
  end

  def calculate_drawdown(high, low)
    format_percentage_value((low - high) / low)
  end
end
