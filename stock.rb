if ARGV.empty? || ENV['API_KEY'].nil?
  puts 'Please provide the valid input'
  exit
end

begin
  quandl_api_key = ENV['API_KEY']
  stock_name = ARGV.first
  date_range_string = ARGV[1..-1].join(' ')
  start_date, end_date = date_range_string.split('-')

  require 'date'
  require 'pry'

  start_date = Date.parse(start_date).strftime('%Y-%m-%d')
  end_date = Date.parse(end_date).strftime('%Y-%m-%d')

  require_relative 'lib/quandl'

  params = {
    api_key: quandl_api_key,
    ticker: stock_name,
    'date.gte': start_date,
    'date.lte': end_date
  }
  api_response = Quandl::Api::V3::Client.request_api(params)
  result = Quandl::Result.new(api_response) if api_response
  puts result.print_closing_prices
  puts result.print_first_n_drawdown
  puts result.print_max_drawdown
  puts ''
  puts result.print_rate_of_return
  puts ''
rescue => error
  puts "Please check your inputs we got error as `#{error}`"
end
