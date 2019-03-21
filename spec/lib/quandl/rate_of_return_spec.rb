require "shared_data.rb"
describe Quandl::RateOfReturn do
  include_context 'shared data'
  include Utils
  let(:return_class) { Quandl::RateOfReturn.new(quandl_result_array) }

  it 'calculate rate of return' do
    expect(return_class.send(:calculate_return, 172.26, 175.0)).to include 2.740000000000009
  end

  it 'formats string' do
    expect(return_class.send(:format_rate_of_return)).to include(
      'Return: 2.740000000000009 [+1.6%] (172.26 on 02.01.18 -> 175.0 on 05.01.18)'
    )
  end
end
