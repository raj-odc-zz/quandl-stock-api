RSpec.shared_context "shared data", :shared_context => :metadata do
  let(:data) {
    {
      'datatable' =>
      {
        'data' =>
        [
          [
            'AAPL',
            '2018-01-05',
            173.44,
            175.37,
            173.05,
            175.0,
            23016177.0,
            0.0,
            1.0,
            173.44,
            175.37,
            173.05,
            175.0,
            23016177.0
          ],
          [
            'AAPL',
            '2018-01-04',
            172.54,
            173.47,
            172.08,
            173.03,
            22211345.0,
            0.0,
            1.0,
            172.54,
            173.47,
            172.08,
            173.03,
            22211345.0
          ],
          [
            'AAPL',
            '2018-01-03',
            172.53,
            174.55,
            171.96,
            172.23,
            28819653.0,
            0.0,
            1.0,
            172.53,
            174.55,
            171.96,
            172.23,
            28819653.0
          ],
          [
            'AAPL',
            '2018-01-02',
            170.16,
            172.3,
            169.26,
            172.26,
            25048048.0,
            0.0,
            1.0,
            170.16,
            172.3,
            169.26,
            172.26,
            25048048.0
          ]
        ]
      }
    }
  }
  let(:quandl_result) { Quandl::Result.new(data) }
  let(:quandl_result_array) { Quandl::Result.new(data).response }
end

RSpec.configure do |rspec|
  rspec.include_context 'shared data', include_shared: true
end
