class CreateCookingIngredientsRecipes < ActiveRecord::Migration
  def change
    create_table :ingredients_recipes do |t|
      t.column :recipe_id, :integer
      t.column :ingredient_id, :integer
    end
  end
end
