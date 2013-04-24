# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cooking_step, :class => 'Step' do
    description 'to do 1'
  end
end
