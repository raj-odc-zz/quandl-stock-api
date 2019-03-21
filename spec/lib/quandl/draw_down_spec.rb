require "shared_data.rb"
describe Quandl::DrawDown do
  include_context 'shared data'
  extend Utils
  let(:drawdown) { Quandl::DrawDown.send(:get_sorted_drawdowns, quandl_result_array).map(&:draw_down) }
  it 'sort by max drawdown from the array of hash' do
    expect(drawdown.first).to eq -1.8
  end

  it 'formats string' do
    expect(Quandl::DrawDown.send(:format_draw_down, quandl_result_array.first)).to \
      include('-1.8% (172.3 on 02.01.18 -> 169.26 on 02.01.18)')
  end

  it 'are in correct order' do
    expect(drawdown).to include(-1.8, -1.5, -1.3, -0.8)
  end
end
