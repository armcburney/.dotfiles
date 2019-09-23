# frozen_string_literal: true

require_relative "../base"

module Model
  # A representation of a Datadog Monitor in Ruby, for my own scripting purposes.
  class Monitor < Model::Base
    # The type of the monitor, i.e., "metric alert"
    #
    # @return [String]
    attr_reader :type

    # @return [String]
    attr_reader :name

    # @return [String]
    attr_reader :message

    # @return [Array[String]]
    attr_reader :tags

    # The query string to monitor based on, i.e.,
    #   "avg(last_5m):sum:system.net.bytes_rcvd{host:host0} > 10"
    #
    # @return [String]
    attr_reader :query

    def initialize(
      type:,
      query:,
      name:,
      message:,
      tags:
    )
      @type    = type
      @query   = query
      @name    = name
      @message = message

      # Use a custom tag to ensure it's easy to batch delete the monitors you
      # created specifically with the API.
      @tags = tags.push("github:armcburney")
    end
  end
end
