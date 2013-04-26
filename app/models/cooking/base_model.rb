module Cooking
  class BaseModel < ActiveRecord::Base
    self.abstract_class = true
    ActiveRecord::Base.establish_connection Rails.configuration.database_configuration['cooking']
  end
end
