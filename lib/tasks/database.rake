#Follow suggestion from Jeremy at https://github.com/rails/rails/issues/3497
# Augment the main migration to migrate your engine, too.
task 'db:migrate', 'cooking:db:migrate'

namespace :cooking do
  namespace :db do
    desc 'Migrates the Cooking database'
    task :migrate => :environment do
      with_engine_connection do
        ActiveRecord::Migrator.migrate("#{File.dirname(__FILE__)}/../../db/migrate", ENV['VERSION'].try(:to_i))
      end
    end
  end
end

# Hack to temporarily connect AR::Base to your engine.
def with_engine_connection
  original = ActiveRecord::Base.remove_connection
  ActiveRecord::Base.establish_connection Rails.configuration.database_configuration['cooking']
  yield
ensure
  ActiveRecord::Base.establish_connection original
end

