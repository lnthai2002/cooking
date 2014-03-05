module Cooking
  class Step < ActiveRecord::Base
    # attr_accessible :title, :body
    belongs_to :recipe
    default_scope :order => 'sequence_number'
    before_create :set_sequence_number
    
    validates :description, presence:true
    #use StepImageUploader to upload image and store url to image column
    mount_uploader :image, StepImageUploader
  
protected
  
    def set_sequence_number
      if self.sequence_number.blank?
        self.sequence_number = self.recipe.steps.maximum('sequence_number').to_i + 1
      end
    end
  end
end
