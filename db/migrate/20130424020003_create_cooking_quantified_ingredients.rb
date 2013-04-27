class CreateCookingQuantifiedIngredients < ActiveRecord::Migration
  def change
    create_table :cooking_quantified_ingredients do |t|
      t.column :recipe_id, :integer
      t.column :ingredient_id, :integer
      t.column :quantity, :string, :limit=>100
      t.timestamps
    end
  end
end
