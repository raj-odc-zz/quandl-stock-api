require_relative './../utils'

module Quandl
  # Represents a result from the Quandl API
  class DrawDown

    extend Utils

    def self.get_max_drawdown(data)
    	output = "Maximum drawdown:"
      get_sorted_drawdowns(data).first(1).each do |stock|
        output += format_draw_down(stock)
      end
      output += "\n"
    end

    def self.get_first_n_drawdown(data, num=3)
      output = "First #{num} Drawdowns: \n"
      get_sorted_drawdowns(data).first(num).each do |stock|
        output += format_draw_down(stock)
      end
      output += "\n"
    end

    private

    def self.format_draw_down(stock)
      formatted_date = format_date(stock.date)
      "#{stock.draw_down}% (#{stock.high} on #{formatted_date} -> #{stock.low} on #{formatted_date})\n"
    end

    def self.get_sorted_drawdowns(data)
      data.sort_by{|stock| stock.draw_down}
    end
  end
end