module Cooking
  class QuantifiedIngredient < BaseModel
    set_table_name :quantified_ingredients
    # attr_accessible :title, :body
    belongs_to :recipe
    belongs_to :ingredient
    accepts_nested_attributes_for :ingredient,:reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? }}
  end
end
