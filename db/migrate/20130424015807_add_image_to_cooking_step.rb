class AddImageToCookingStep < ActiveRecord::Migration
  def change
    add_column :cooking_steps, :image, :string
  end
end
