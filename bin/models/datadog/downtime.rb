# frozen_string_literal: true

require_relative "../base"

module Model
  # A representation of a Datadog Downtime in Ruby, for my own scripting purposes.
  class Downtime < Model::Base
    # @return [String]
    attr_reader :scope

    # @return [Array[String]]
    attr_reader :monitor_tags

    # @return [DateTime]
    attr_reader :start_ts

    # @return [DateTime]
    attr_reader :end_ts

    # @return [Hash]
    attr_reader :recurrence

    def initialize(
      scope:,
      monitor_tags:,
      start_ts:,
      end_ts:,
      recurrence: nil
    )
      @scope        = scope
      @monitor_tags = monitor_tags
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
