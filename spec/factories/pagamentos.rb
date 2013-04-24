# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pagamento do
    valor 1.5
    tipo "MyString"
    forma_de_pagamento "MyString"
  end
end
