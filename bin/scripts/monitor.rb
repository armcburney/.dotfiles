# frozen_string_literal: true

require_relative "script"
require_relative "../shared/datadog/monitor"
require_relative "../models/datadog/monitor"

module Scripts
  class Monitor < Script
    def self.description
      "A simple CLI for managing monitors using the datadog API."
    end

    def self.execute!(params = {})
      Error.not_enough_arguments(1) if params[:command].nil?

      service = Datadog::Monitor.new

      case params[:command]
      when "create"
        monitor = Model::Monitor.new(
          type: "metric alert",
          query: "avg(last_5m):sum:system.net.bytes_rcvd{host:host0} > 100",
          name: "test monitor armcburney",
          message: "test a monitor",
          tags: ["env:test"]
        )
        service.create!([monitor])
      when "delete_all"
        service.delete_all!
      when "get_all"
        service.get_all
      else
        UI.error("Unsupported command!")
      end
    end
  end
end
