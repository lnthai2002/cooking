module Cooking
  class QuantifiedIngredient < ActiveRecord::Base
    # attr_accessible :title, :body
    belongs_to :recipe
    belongs_to :ingredient
    validates :quantity, presence:true
    accepts_nested_attributes_for :ingredient
  end
end
