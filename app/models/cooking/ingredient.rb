module Cooking
  class Ingredient < ActiveRecord::Base
    has_many :recipes, :through=>:quantified_ingredients
    validates :name, presence:true
    #use IngredientImageUploader to upload image and store url to image column
    mount_uploader :image, IngredientImageUploader
  end
end
