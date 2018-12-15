# coding: utf-8
# frozen_string_literal: true

require "colored"
require "highline/import"
require "logger"
require "tty-screen"

# Printing functions taken from fastlane: https://github.com/fastlane/fastlane
module UI
  module_function

  # Instantiates and returns a memoized logger.
  #
  # @return [::Logger]
  def log
    return @log if @log

    $stdout.sync = true
    @log ||= Logger.new($stdout)

    @log.formatter = proc do |_, datetime, _, msg|
      "#{format_string(datetime)}#{msg}\n"
    end

    @log
  end

  # Formats a Time object into a string.
  #
  # @param [Time]
  # @return [String]
  def format_string(datetime = Time.now)
    "[#{datetime.strftime('%H:%M:%S')}]: "
  end

  #####################################################
  # @!group Messaging: show text to the user
  #####################################################

  def error(message)
    log.error(message.to_s.red)
  end

  def important(message)
    log.warn(message.to_s.yellow)
  end

  def success(message)
    log.info(message.to_s.green)
  end

  def message(message)
    log.info(message.to_s)
  end

  def deprecated(message)
    log.error(message.to_s.deprecated)
  end

  def command(message)
    log.info("$ #{message}".cyan)
  end

  def command_output(message)
    actual = message.split("\r").last || ""
    actual.split("\n").each do |msg|
      prefix = msg.include?("▸") ? "" : "▸ "
      log.info(prefix + "" + msg.magenta)
    end
  end

  def header(message)
    format = format_string
    if message.length + 8 < TTY::Screen.width - format.length
      message = "--- #{message} ---"
      i = message.length
    else
      i = TTY::Screen.width - format.length
    end
    success("-" * i)
    success(message)
    success("-" * i)
  end

  def content_error(content, error_line)
    error_line = error_line.to_i
    return unless error_line > 0

    contents = content.split(/\r?\n/).map(&:chomp)

    start_line = error_line - 2 < 1 ? 1 : error_line - 2
    end_line = error_line + 2 < contents.length ? error_line + 2 : contents.length

    Range.new(start_line, end_line).each do |line|
      str = line == error_line ? " => " : "    "
      str << line.to_s.rjust(Math.log10(end_line) + 1)
      str << ":\t#{contents[line - 1]}"
      error(str)
    end
  end

  #####################################################
  # @!group Errors: Inputs
  #####################################################

  def interactive?
    $stdout.isatty != false
  end

  def input(message)
    verify_interactive!(message)
    ask("#{format_string}#{message.to_s.yellow}").to_s.strip
  end

  def confirm(message)
    verify_interactive!(message)
    agree("#{format_string}#{message.to_s.yellow} (y/n)", true)
  end

  def select(message, options)
    verify_interactive!(message)
    important(message)
    choose(*options)
  end

  def password(message)
    verify_interactive!(message)
    ask("#{format_string}#{message.to_s.yellow}") { |q| q.echo = "*" }
  end

  def verify_interactive!(message)
    return if interactive?

    important(message)
    crash!("Could not retrieve response running in non-interactive mode.")
  end
end
