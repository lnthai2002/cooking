module Cooking
  class Ingredient < BaseModel
    set_table_name :ingredients
    # attr_accessible :title, :body
    has_many :recipes, :through=>:quantified_ingredients
    #use IngredientImageUploader to upload image and store url to image column
    mount_uploader :image, IngredientImageUploader
  end
end
