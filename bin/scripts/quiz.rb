# frozen_string_literal: true

require "yaml"
require_relative "script"

module Scripts
  class Quiz < Script
    def self.description
      "Runs a quiz given a YAML file of KVPs (Question => Answer)."
    end

    def self.execute!(params = {})
      path = params[:path]
      UI.header("Running a quiz for #{path}.")
      yaml = YAML.safe_load(File.read(path))

      # Keep track of questions not answered correctly yet.
      incorrect = yaml

      # Keep quizzing until the user guesses everything.
      until incorrect.empty?
        current_incorrect = {}

        # Ask each of the questions randomly.
        incorrect.to_a.shuffle.each do |question, answer|
          UI.message(question)
          UI.ask("Press any key to see answer...")
          UI.success(answer)
          response = UI.select("Answered correctly?", %w[y n])
          next if response == "y"

          current_incorrect[question] = answer
        end

        num_answered = incorrect.size - current_incorrect.size
        UI.header("Answered #{num_answered}/#{incorrect.size}.")
        incorrect = current_incorrect
      end
    end

    def self.usage
      "#{script_name} </path/to/quiz.yml>"
    end
  end
end
