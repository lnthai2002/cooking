class AddImageToCookingStep < ActiveRecord::Migration
  #Use separated database
  def self.connection
    Cooking::BaseModel.connection
  end

  def change
    add_column :steps, :image, :string
  end
end
