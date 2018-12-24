# frozen_string_literal: true

require "mail"
require "slim"
require "yaml"

#
# Simple Mailer class to send out batch emails using Simple Mail Transfer
# Protocol.
#
class Mailer
  # Instantiates a new `Mailer` object.
  #
  # @param [String] path
  def initialize(path)
    @content = File.read(path)
    Mail.defaults { delivery_method :smtp, options }
  end

  # Sends emails out in batch.
  def send!
    email_hashes = YAML.safe_load(content)["emails"]
    email_hashes.each { |email_hash| new_email(email_hash).deliver }
  end

  private

  # Content from the YAML file associated with the mailer.
  #
  # @return [String]
  attr_reader :content

  # Options for the mailer.
  #
  # @return [Hash]
  def options
    {
      address: "smtp.gmail.com",
      port: 587,
      user_name: ENV["USERNAME"],
      password: ENV["PASSWORD"],
      authentication: "plain",
      enable_starttls_auto: true
    }
  end

  # Creates a new email object from a hash representation.
  #
  # @param  [Hash] email_hash
  # @return [Mail::Mail]
  def new_email(email_hash)
    Mail.new do
      to      email_hash["to"]
      from    email_hash["sender"]
      subject email_hash["subject"]

      html_part do
        content_type "text/html; charset=UTF-8"
        body Slim::Template
          .new("templates/#{email_hash['template']}.slim")
          .render(Object.new, email: email_hash)
      end
    end
  end
end
