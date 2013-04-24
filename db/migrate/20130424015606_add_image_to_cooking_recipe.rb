class AddImageToCookingRecipe < ActiveRecord::Migration
  #Use separated database
  def self.connection
    Cooking::BaseModel.connection
  end

  def change
    add_column :recipes, :image, :string
  end
end
