class CreateCookingIngredients < ActiveRecord::Migration
  #Use separated database
  def self.connection
    Cooking::BaseModel.connection
  end

  def change
    create_table :ingredients do |t|
      t.column :name, :string
      t.timestamps
    end
  end
end
