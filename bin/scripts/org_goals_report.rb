# coding: utf-8
# frozen_string_literal: true

require_relative "script"

module Scripts
  class OrgGoalsReport < Script
    def self.description
      "Generates a new report for my goals."
    end

    def self.execute!(_params = {})
      UI.header("org-goals-report")

      date   = Time.now.strftime("%F")
      parser = Org::Parser.new(Const::Org::GOALS_README_PATH)

      h0_headings = parser.headings
      h1_headings = h0_headings.subheadings
      h2_headings = h1_headings.flat_map(&:subheadings)

      categories = h2_headings.map do |h2|
        h3_headings = h2.subheadings

        goals = h3_headings.map do |h3|
          name   = h3.text
          rating = UI.input("How would you rate your progress on goal #{name}? ")
          desc   = UI.input("Brief description why: ")

          Model::Goal.new(
            name: name,
            description: desc,
            date: date,
            rating: rating.to_i
          )
        end

        Model::Category.new(name: h2.text, goals: goals)
      end

      serialized_categories = categories.serialize!
      org_report_path = File.join(Const::Org::GOALS_REPORTS_PATH, "#{date}.json")

      begin
        File.write(org_report_path, serialized_categories)
        UI.success("Wrote #{org_report_path} successfully! 💯")
      rescue Error
        UI.error("Error writing #{org_report_path}! 😳")
      end
    end
  end
end
