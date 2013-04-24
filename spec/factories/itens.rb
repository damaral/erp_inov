# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    quantidade 1
    descricao "MyText"
    sub_total 1.5
    altura 1.5
    comprimento 1.5
  end
end
