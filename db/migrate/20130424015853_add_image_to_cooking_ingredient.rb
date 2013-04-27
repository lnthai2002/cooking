class AddImageToCookingIngredient < ActiveRecord::Migration
  def change
    add_column :cooking_ingredients, :image, :string
  end
end
