# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :os do
    data_entrega "2013-04-23"
    previsao_entrega "2013-04-23"
    observacao "MyText"
    desconto 1.5
    arquivo "MyString"
    estado "MyString"
    esta_pago false
    cliente
  end
end
