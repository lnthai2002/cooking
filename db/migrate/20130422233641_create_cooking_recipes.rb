class CreateCookingRecipes < ActiveRecord::Migration
  #Use separated database
  def self.connection
    Cooking::BaseModel.connection
  end

  def change
    create_table :recipes do |t|
      t.column :name, :string
      t.column :description, :string
      t.timestamps
    end
  end
end
