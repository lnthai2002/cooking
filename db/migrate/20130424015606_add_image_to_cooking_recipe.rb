class AddImageToCookingRecipe < ActiveRecord::Migration
  def change
    add_column :cooking_recipes, :image, :string
  end
end
