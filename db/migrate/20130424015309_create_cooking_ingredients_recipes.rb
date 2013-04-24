class CreateCookingIngredientsRecipes < ActiveRecord::Migration
  #Use separated database
  def self.connection
    Cooking::BaseModel.connection
  end

  def change
    create_table :ingredients_recipes do |t|
      t.column :recipe_id, :integer
      t.column :ingredient_id, :integer
    end
  end
end
