module Cooking
  class QuantifiedIngredient < BaseModel
    # attr_accessible :title, :body
    belongs_to :recipe
    belongs_to :ingredient
    accepts_nested_attributes_for :ingredient,:reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? }}
  end
end
