# frozen_string_literal: true

require 'abstraction'
require 'active_record'
require 'erb'
require 'singleton'
require 'yaml'

module |main|
  #
  # Database module for |main|
  #
  module Database
    # Establish connection to database
    ActiveRecord::Base.establish_connection(
      YAML.safe_load(ERB.new(File.read('config/database.yml')).result)
    )

    #
    # Abstract class for writing data to database tables
    #
    class ORM
      abstract

      protected

      # Must be overwritten by child class extending abstract class
      def create
        raise NotImplementedError
      end

      # Must be overwritten by child class extending abstract class
      def read
        raise NotImplementedError
      end

      # Must be overwritten by child class extending abstract class
      def update
        raise NotImplementedError
      end

      # Must be overwritten by child class extending abstract class
      def delete
        raise NotImplementedError
      end
    end

    require_relative 'users.rb'
  end
end
