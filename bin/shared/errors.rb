# frozen_string_literal: true

require_relative "ui"

module Error
  module_function

  def not_enough_arguments(n)
    UI.error("Not enough arguments. Please provide at least #{n} arguments.")
    exit(1)
  end

  def not_exact_arguments(n)
    UI.error("Please provide #{n} arguments.")
    exit(1)
  end
end
