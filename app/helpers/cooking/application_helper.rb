module Cooking
  module ApplicationHelper
    #Overide default image_tag to fall back to error image to avoid compiled blank image not found in production 
    def image_tag(source, options={})
      source = "cooking/image_not_available.png" if source.blank?
      super(source, options)
    end

    def random_image_version(imageable, base_version, max)
      version = "#{base_version}_#{Random.rand(max)}"
      return imageable.image_url(version.to_sym).to_s
    end
  end
end
