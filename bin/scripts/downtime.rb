# frozen_string_literal: true

require_relative "script"
require_relative "../shared/datadog/downtime"
require_relative "../models/datadog/downtime"

module Scripts
  class Downtime < Script
    def self.description
      "A simple CLI for managing downtimes using the datadog API."
    end

    def self.execute!(params = {})
      Error.not_enough_arguments(1) if params[:command].nil?

      service = Datadog::Downtime.new

      case params[:command]
      when "create"
        start_ts = Time.now.to_i
        end_ts = start_ts + (3 * 60 * 60)

        downtime = Model::Downtime.new(
          scope: "github:armcburney",
          start_ts: start_ts,
          end_ts: end_ts
        )
        service.create!(downtimes: [downtime])
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
