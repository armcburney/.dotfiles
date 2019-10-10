# frozen_string_literal: true

require "dogapi"
require "pp"

module Datadog
  class Monitor
    attr_reader :dog

    def initialize
      api_key = ENV["DATADOG_API_KEY"]
      application_key = ENV["DATADOG_APP_KEY"]
      @dog = Dogapi::Client.new(api_key, application_key)
    end

    # Generates Monitors using the Datadog API.
    #
    # @param [Integer] number_of_monitors: The number of monitors to generate.
    def generate!(number:)
      number.times do |i|
        monitor = generate_monitor!(i)
        options = {
          "notify_no_data" => true,
          "no_data_timeframe" => 20
        }
        dog.monitor(
          monitor.type,
          monitor.query,
          name: monitor.name,
          message: monitor.message,
          tags: monitor.tags,
          options: options
        )
      end
    end

    # Creates Monitors using the Datadog API.
    #
    # @param [Array[Model::Monitors]] monitors
    def create!(monitors:)
      monitors.each do |monitor|
        options = {
          "notify_no_data" => true,
          "no_data_timeframe" => 20
        }
        dog.monitor(
          monitor.type,
          monitor.query,
          name: monitor.name,
          message: monitor.message,
          tags: monitor.tags,
          options: options
        )
      end
    end

    # Deletes all monitors using the API.
    def delete_all!
      monitors = get_all[1]
      monitor_names = monitors.map.with_index { |m, i| "#{i + 1}: " + m["name"] }.join("\n")

      UI.success("Warning! This will delete the following monitors: ")
      UI.message(monitor_names)
      response = UI.select("Are you sure you want to proceed?", %w[y n])

      if response == "n"
        UI.message("Exiting without deleting monitors!")
        exit
      end

      monitors.each do |m|
        dog.delete_monitor(m["id"])
      end

      p dog.get_all_monitors
    end

    # Returns all monitors from the API. Restricts it to only monitors created
    # with the `github:armcburney` tag.
    def get_all
      options = {
        "tags" => ["github:armcburney"]
      }
      m = dog.get_all_monitors(options: options)
      pp m
      m
    end

    private

    def generate_monitor!(i)
      Model::Monitor.new(
        type: "metric alert",
        query: "avg(last_5m):sum:system.net.bytes_rcvd{host:host0} > 100",
        name: "test monitor armcburney #{i}",
        message: "test a monitor",
        tags: ["env:test"]
      )
    end
  end
end
