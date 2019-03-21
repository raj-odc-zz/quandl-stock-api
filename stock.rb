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
  api_response = Quandl.get_api_data(params)
  result = Quandl::Result.new(api_response) if api_response
  messages = []
  messages << result.print_closing_prices
  messages << result.print_first_n_drawdown
  messages << result.print_max_drawdown
  messages << result.print_rate_of_return

  puts messages

  puts "\nWould you like to share it by E-mail or None? [email/none]"
  share = STDIN.gets.chomp
  case share
  when 'email'
    puts "\nWho should we send the e-mail to?"
    email = STDIN.gets.chomp
    Quandl.send_email(email, messages, params['ticker'], start_date, end_date)
    puts 'Kindly start mailcatcher and open url `http://127.0.0.1:1080/`'
  end
  puts 'Thank you for using the system'
rescue => error
  puts "Please check your inputs we got error as `#{error}`"
end
