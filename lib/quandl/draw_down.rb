require_relative './../utils'

module Quandl
  # Represents a result from the Quandl API
  class DrawDown
    extend Utils

    class << self
      def max_drawdown(data)
        output = 'Maximum drawdown:'
        get_sorted_drawdowns(data).first(1).each do |stock|
          output += format_draw_down(stock)
        end
        output += "\n"
      end

      def first_n_drawdown(data, num = 3)
        output = "First #{num} Drawdowns: \n"
        get_sorted_drawdowns(data).first(num).each do |stock|
          output += format_draw_down(stock)
        end
        output += "\n"
      end

      private

      def format_draw_down(stock)
        formatted_date = format_date(stock.date)
        "#{stock.draw_down}% (#{stock.high} on #{formatted_date}" \
          " -> #{stock.low} on #{formatted_date})\n"
      end

      def get_sorted_drawdowns(data)
        data.sort_by(&:draw_down)
      end
    end
  end
end
