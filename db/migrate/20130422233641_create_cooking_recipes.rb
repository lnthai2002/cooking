class CreateCookingRecipes < ActiveRecord::Migration
  def change
    create_table :cooking_recipes do |t|
      t.column :name, :string
      t.column :description, :string
      t.timestamps
    end
  end
end
