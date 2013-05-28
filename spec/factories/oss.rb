# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :os do
    data_entrega "2013-04-23"
    previsao_entrega "2013-04-23"
    observacao "MyText"
    estado "MyString"
    esta_pago false
    cliente
    aprovado_por Os::CLIENTE
  end
end
