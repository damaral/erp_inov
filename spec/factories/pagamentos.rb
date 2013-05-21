# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pagamento do
    valor 10
    forma_de_pagamento Pagamento::DINHEIRO
    esta_pago true
    data_prevista Date.today
  end
end
