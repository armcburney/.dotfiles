# frozen_string_literal: true

require_relative "base"

class Array
  # Serializes an Array to a JSON representation.
  #
  # @return [String]
  def serialize!
    map(&:serialize!).to_json
  end

  # Deserializes a JSON representation back to an Array.
  #
  # @param [String]
  # @return [Array[Model]]
  def self.deserialize!(json)
    array = JSON.parse(json)
    array.map { |s| Model::Base.deserialize!(s) }
  end
end
