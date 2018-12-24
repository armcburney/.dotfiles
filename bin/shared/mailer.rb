# frozen_string_literal: true

require "mail"
require "slim"
require "yaml"

#
# Simple Mailer class to send out batch emails using Simple Mail Transfer
# Protocol.
#
class Mailer
  attr_reader :emails

  def initialize
    @emails = YAML.safe_load(File.read("emails.yml"))["emails"]
    configure
  end

  def configure
    Mail.defaults { delivery_method :smtp, Mailer.options }
  end

  def send_emails
    emails.each { |email| new_email(email).deliver }
  end

  def self.options
    {
      address:              "smtp.gmail.com",
      port:                 587,
      user_name:            ENV["USERNAME"],
      password:             ENV["PASSWORD"],
      authentication:       "plain",
      enable_starttls_auto: true
    }
  end

  private

  def new_email(email)
    Mail.new do
      to      email["to"]
      from    email["sender"]
      subject email["subject"]

      html_part do
        content_type "text/html; charset=UTF-8"
        body Slim::Template
               .new("templates/#{email['template']}.slim")
               .render(Object.new, email: email)
      end
    end
  end
end
