# frozen_string_literal: true

require "org-ruby"

module Org
  Heading = Struct.new(:headline, :subheadings) do
    # The level of the heading. Zero if the heading is the `nil` heading.
    #
    # @return [Integer]
    def level
      headline&.level || 0
    end

    # The heading text. Empty string if the heading is the `nil` heading.
    #
    # @return [String]
    def text
      headline&.headline_text || ""
    end
  end

  class Parser
    # The org file source.
    #
    # @return [String]
    attr_reader :source

    # The Orgmode::Parser instance.
    #
    # @return [Orgmode::Parser]
    attr_reader :parser

    # Returns the headlines in a structured hierarchical format.
    #
    # @return [Org::Heading]
    attr_reader :headings

    # Instantiates a new OrgParser object.
    #
    # @param  [String] org_file_path
    # @return [nil]
    def initialize(org_file_path)
      @source = File.read(org_file_path)
      @parser = Orgmode::Parser.new(source)
      @headings ||= hierarchical_headings
    end

    private

    def hierarchical_headings
      parent_heading = Org::Heading.new(nil, [])
      parent_stack   = []

      parser.headlines.each do |headline|
        heading = Org::Heading.new(headline, [])
        parent_heading = parent_stack.pop until heading.level > parent_heading.level
        parent_heading.subheadings.push(heading)
        parent_stack.push(parent_heading)
        parent_heading = heading
      end

      parent_heading = parent_stack.pop until parent_stack.empty?
      parent_heading
    end
  end
end
