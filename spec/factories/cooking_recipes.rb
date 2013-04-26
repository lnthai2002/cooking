# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe, :class => 'Recipe' do
    name 'recipe 1'
    description 'description for recipe 1'
  end
end