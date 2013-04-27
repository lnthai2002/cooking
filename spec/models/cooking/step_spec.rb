require 'spec_helper'

module Cooking
  describe Step do
    it 'must belong to a recipe' do
      step = Step.new
      step.should be_respond_to(:recipe)
    end
    
    it 'should have an image' do
      step = Step.new
      step.should be_respond_to(:image)
    end
  
    it 'must be created in sequence' do
      recipe = FactoryGirl.create(:cooking_recipe)
      step = FactoryGirl.build(:cooking_step, :recipe=>recipe)
      step.save
      step.sequence_number.should == 1
    end
  end
end