# frozen_string_literal: true

# Active Record representation of User model
require_relative 'models/user.rb'

module |main|
  module Database
    #
    # Singleton class for writing users to database
    #
    class Users < ORM
      include Singleton

      # Create user
      def create() end

      # Reads user
      def read() end

      # Updates user
      def update() end

      # Deletes user
      def delete() end
    end
  end
end
