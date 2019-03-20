# Module helpful for calling the api and result
module Quandl
  extend self
  require 'httparty'
  require 'mail'
  require 'pry'
  require_relative 'quandl/api/v3/client'
  require_relative 'quandl/result'
  extend Utils

  def get_api_data(params)
    Quandl::Api::V3::Client.request_api(params)
  end

  def send_email(email, messages, stock, start_date, end_date)
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end

    subject = "Stock Information - #{stock} between #{format_date(start_date)}"\
      " and #{format_date(end_date)}"

    messages = add_mail_message(messages).join("\n")

    Mail.deliver do
      to email
      from 'no-reply@test.com'
      subject subject

      text_part do
        body messages
      end
    end
  end

  def add_mail_message(messages)
    messages.unshift('Please find the following information for the given stock')
    messages.unshift('Hi,')
    messages << ''
    messages << ''
    messages << 'Regards,'
    messages << 'Team Quandl'
  end
end
