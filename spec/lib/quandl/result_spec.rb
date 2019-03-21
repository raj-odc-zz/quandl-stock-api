require "shared_data.rb"
describe Quandl::Result do
  include_context 'shared data'

  describe 'expecting result' do
    it 'should print the closing prices' do
      expect(quandl_result.print_closing_prices).to include('02.01.18: Closed at 172.26 (169.26 ~ 172.3)')
    end
    it 'should print the first 3 drawdown' do
      expect(quandl_result.print_first_n_drawdown).to include('-1.8% (172.3 on 02.01.18 -> 169.26 on 02.01.18)')
    end
    it 'should print max drawdown' do
      expect(quandl_result.print_max_drawdown).to include('-1.8% (172.3 on 02.01.18 -> 169.26 on 02.01.18)')
    end
    it 'print the rate of return' do
      expect(quandl_result.print_rate_of_return).to include('Return: 2.740000000000009 [+1.6%] (172.26 on 02.01.18 -> 175.0 on 05.01.18)')
    end
  end
end
