# frozen_string_literal: true

require_relative "script"
require_relative "../shared/datadog/monitor"

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
        service.create!
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
