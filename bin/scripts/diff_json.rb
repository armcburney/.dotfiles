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

      differ = Shared::JSONDiffer.new(one: params[:one], two: params[:two])

      UI.message("Finding differences...")
      differ.diff
      UI.message("Found differences.")

      UI.header("Summary of differences:")
      UI.message("Additions: #{differ.additions.size}")
      UI.message("Deletions: #{differ.deletions.size}")
      UI.message("Similarities: #{differ.similarities.size}")

      return if params[:no_diff]

      UI.header("Additions:")
      pp differ.additions

      UI.header("Deletions:")
      pp differ.deletions

      UI.header("Similarities:")
      pp differ.similarities
    rescue Errno::ENOENT => e
      UI.error("Error executing command due to: #{e}")
    rescue SystemExit, Interrupt
    end
  end
end
