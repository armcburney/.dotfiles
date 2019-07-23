# frozen_string_literal: true

require "dogapi"

module Datadog
  class Monitor
    attr_reader :dog

    def initialize
      api_key = ENV["DATADOG_API_KEY"]
      application_key = ENV["DATADOG_APP_KEY"]
      @dog = Dogapi::Client.new(api_key, application_key)
    end

    # Creates 10 monitors with different names and messages.
    def create!
      10.times do |i|
        options = {
          "notify_no_data" => true,
          "no_data_timeframe" => 20
        }
        tags = ["app:webserver", "frontend"]
        dog.monitor(
          "metric alert",
          "avg(last_5m):sum:system.net.bytes_rcvd{host:host0} > 100",
          name: "MONITOR #{i}",
          message: "INDEX: #{i}",
          tags: tags,
          options: options
        )
      end
    end

    # Deletes all monitors using the API.
    def delete_all!
      get_all[1].each do |m|
        dog.delete_monitor(m["id"])
      end
      p dog.get_all_monitors
    end

    # Returns all monitors from the APi.
    def get_all
      m = dog.get_all_monitors
      p m
      m
    end
  end
end
