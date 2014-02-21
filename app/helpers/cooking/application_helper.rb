module Cooking
  class MenuBuilder < TabsOnRails::Tabs::Builder
    def add_raw(string)
      @tabs[:list] << string
    end

    def tab_for(tab, name, options, item_options = {})
      if current_tab?(tab)
        @tabs[:list] << @context.link_to(name, '#')
        @tabs[:current] = @tabs[:list].size - 1 #position of active link in the list
      else
        @tabs[:list] << @context.link_to(name, options, item_options)
      end
    end

    #How I want the list of tabs appear
    def build_tabs(options)
      output = ActiveSupport::SafeBuffer.new
      if @tabs[:current]
        output << @tabs[:list].delete_at(@tabs[:current])
      else#take the first tab and don't decorate it
        output << @tabs[:list].delete_at(0)
        @options[:active][:class] = ''
      end
      @options[:active][:class] = 'has-dropdown ' + @options[:active][:class] 

      idles = ActiveSupport::SafeBuffer.new
      @tabs[:list].each do |idle_link|
        idles << @context.content_tag('li') do
          idle_link
        end
      end

      output << @context.content_tag('ul', class: 'dropdown') do
        idles.to_s
      end
      return @context.content_tag('ul', options[:open_tabs]) do
        @context.content_tag('li', @options[:active]) do
          output.to_s
        end.to_s
      end.to_s.html_safe
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
