module Cooking
  class BaseModel < ActiveRecord::Base
    ActiveRecord::Base.establish_connection Rails.configuration.database_configuration['cooking']
  end
end
