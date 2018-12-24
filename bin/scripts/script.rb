# frozen_string_literal: true

module Scripts
  %w[commands models shared].each do |dir|
    Dir[File.join(__dir__, "../#{dir}", "*.rb")].each { |file| require file }
  end

  # Base class for scripts located on $PATH.
  class Script
    # The author who wrote the script, default to Andrew McBurney.
    #
    # @return [String]
    def self.author
      "Andrew Robert McBurney <andrewrobertmcburney@gmail.com>"
    end

    # A brief description of the script, implemented in the subclass.
    #
    # @return [String]
    def self.description
      raise "Not implemented error."
    end

    # Executes the script. Handles the majority of the script's logic. Implemented
    # in the subclass.
    #
    # @param  [Hash] _params
    # @return [Boolean]
    def self.execute!(_params = {})
      raise "Not implemented error."
    end

    # The name of the script. Converts the `Module::ClassName` to `class-name`.
    #
    # @return [String]
    def self.script_name
      name
        .split("::")[1]
        .split(/(?=[A-Z])/)
        .map(&:downcase)
        .join("-")
    end

    # A brief description of the script's usage, implemented in the subclass.
    #
    # @return [String]
    def self.usage
      script_name
    end
  end
end
