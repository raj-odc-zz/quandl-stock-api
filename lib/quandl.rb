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

  def send_email(params)
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end

    subject = "Stock Information - #{params[:stock]} between #{format_date(params[:start_date])}"\
      " and #{format_date(params[:end_date])}"

    messages = add_mail_message(params[:messages]).join("\n")

    Mail.deliver do
      to params[:email]
      from 'no-reply@test.com'
      subject subject

      text_part do
        body messages
      end
    end
  end

  def add_mail_message(messages)
    first_message = ['Hi,', 'Please find the following information for given stock']
    final_message = ['', '', 'Regards,', 'Team Quandl']
    first_message + messages + final_message
  end
end
