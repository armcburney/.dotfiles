# frozen_string_literal: true

module Shared
  class JSONDiffer
    def initialize(one:, two:)
      file_one_path = File.path(one)
      file_two_path = File.path(two)

      file_one = File.read(file_one_path)
      file_two = File.read(file_two_path)

      @json_one = JSON.parse(file_one)
      @json_two = JSON.parse(file_two)
    end

    def diff(use_lcs: false)
      @diff ||= Hashdiff.diff(json_one, json_two, use_lcs: use_lcs)
    end

    def additions
      @additions ||= diff.select { |d| d[0] == "+" }
    end

    def deletions
      @deletions ||= diff.select { |d| d[0] == "-" }
    end

    def similarities
      @similarities ||= diff.select { |d| d[0] == "~" }
    end

    private

    attr_reader :json_one, :json_two
  end
end
