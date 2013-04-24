class AddImageToCookingIngredient < ActiveRecord::Migration
  #Use separated database
  def self.connection
    Cooking::BaseModel.connection
  end

  def change
    add_column :ingredients, :image, :string
  end
end
