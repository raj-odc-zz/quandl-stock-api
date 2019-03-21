require_relative '../../lib/utils'
RSpec.configure do |mod|
  mod.include Utils
end
describe Utils do
  context 'format the given date' do
    it 'should return as invalid when the given date is wrong format' do
      expect { format_date('2018-22-12') }.to raise_error ArgumentError
    end

    it 'should match the exact format as d.m.yyyy' do
      expect(format_date('2018-01-02')).to eq '02.01.18'
    end
  end
  context 'format the given price as two digit' do
    it 'should return the same as given input if already formatted' do
      expect(round_of_price(171.23)).to eq 171.23
    end

    it 'should match the exact format as two digit price' do
      expect(round_of_price(121.23432424)).to eq 121.23
    end
  end
  context 'calculate the drawdown' do
    it 'should return the drawdown value for the given stock data' do
      expect(calculate_drawdown(172.3, 169.26)).to eq -1.8
    end
  end
end
