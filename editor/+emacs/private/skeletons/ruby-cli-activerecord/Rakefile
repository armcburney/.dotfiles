# frozen_string_literal: true

require 'active_record'
require 'erb'
require 'require_all'
require 'yaml'

require_relative 'app/database/database.rb'

namespace :db do
  db_config = YAML.safe_load(ERB.new(File.read('config/database.yml')).result)
  db_config_admin = db_config.merge(
    'database'           => 'mysql',
    'schema_search_path' => 'public'
  )

  desc 'Create the database'
  task :create do
    ActiveRecord::Base.establish_connection(db_config_admin)
    ActiveRecord::Base.connection.create_database(db_config['database'])
  end

  desc 'Seeds the database'
  task :seed do
    ActiveRecord::Base.establish_connection(db_config)
    require_all 'app/database/models/*.rb'
    require_relative 'db/seeds.rb'
  end

  desc 'Migrates the database'
  task :migrate do
    ActiveRecord::Base.establish_connection(db_config)
    ActiveRecord::Migrator.migrate('db/migrate/')
    Rake::Task['db:schema'].invoke
  end

  desc 'Drops the database'
  task :drop do
    ActiveRecord::Base.establish_connection(db_config_admin)
    ActiveRecord::Base.connection.drop_database(db_config['database'])
  end

  desc 'Resets the database'
  task reset: %i[drop create migrate]

  desc 'Create a portable db/schema.rb file against any DB supported by AR'
  task :schema do
    ActiveRecord::Base.establish_connection(db_config)
    require 'active_record/schema_dumper'
    filename = 'db/schema.rb'

    File.open(filename, 'w:utf-8') do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
  end
end

namespace :generate do
  desc 'Generates migration'
  task :migration do
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    name = ARGV[1] || raise('Run: rake generate:migration migration_name')
    path = File.expand_path("../db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.camelize

    File.open(path, 'w') do |file|
      file.write <<~EOF
        #
        # #{migration_class} migration
        #
        class #{migration_class} < ActiveRecord::Migration[5.0]
          def change
          end
        end
      EOF
    end

    abort
  end
end
