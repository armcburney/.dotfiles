# frozen_string_literal: true

require_relative "../base"

module Model
  # A representation of a Datadog Downtime in Ruby, for my own scripting purposes.
  class Downtime < Model::Base
    # @return [Array[String]]
    attr_reader :scope

    # @return [DateTime]
    attr_reader :start_ts

    # @return [DateTime]
    attr_reader :end_ts

    # @return [Hash]
    attr_reader :recurrence

    def initialize(
      scope:,
      start_ts:,
      end_ts:,
      recurrence: nil
    )
      @scope        = scope
      @start_ts     = start_ts
      @end_ts       = end_ts
      @recurrence   = recurrence || default_recurrence
    end

    private

    def default_recurrence
      end_reccurrence_ts = start_ts + (4 * 7 * 24 * 60 * 60)

      {
        "type" => "weeks",
        "period" => 1,
        "week_days" => ["Mon", "Tue", "Wed", "Thu", "Fri"],
        "until_date" => end_reccurrence_ts
      }
    end
  end
end
