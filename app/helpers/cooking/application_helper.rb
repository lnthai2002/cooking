module Cooking
  class MenuTabBuilder < TabsOnRails::Tabs::Builder
    def open_tabs(options = {})
      @context.tag('ul', options, open = true)
    end
  
    def close_tabs(options = {})
      '</ul>'.html_safe
    end
  
    def tab_for(tab, name, options, item_options = {})
      item_options[:class] = (current_tab?(tab) ? 'active' : '')
      @context.content_tag('li', item_options) do
        @context.link_to(name, options)
      end
    end
  end

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
