class CreateCookingQuantifiedIngredients < ActiveRecord::Migration
  #Use separated database
  def self.connection
    Cooking::BaseModel.connection
  end

  def change
    create_table :quantified_ingredients do |t|
      t.column :recipe_id, :integer
      t.column :ingredient_id, :integer
      t.column :quantity, :string, :limit=>100
      t.timestamps
    end
  end
end
