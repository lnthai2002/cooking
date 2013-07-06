module Cooking
  module ApplicationHelper
    #Overide default image_tag to fall back to error image to avoid compiled blank image not found in production 
    def image_tag(source, options={})
      source = "image_not_available.png" if source.blank?
      super(source, options)
    end
  end
end
