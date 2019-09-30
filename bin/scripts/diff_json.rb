# frozen_string_literal: true

require "json"
require "hashdiff"
require_relative "script"

module Scripts
  class DiffJSON < Script
    def self.description
      "Diff two JSON files."
    end

    def self.execute!(params = {})
      Error.not_enough_arguments(2) if params[:one].nil? || params[:two].nil?

      file_one_path = File.path(params[:one])
      file_two_path = File.path(params[:two])

      file_one = File.read(file_one_path)
      file_two = File.read(file_two_path)

      json_one = JSON.parse(file_one)
      json_two = JSON.parse(file_two)

      pp Hashdiff.diff(json_one, json_two)
    rescue Errno::ENOENT => e
      UI.error("Error executing command due to: #{e}")
    end
  end
end
