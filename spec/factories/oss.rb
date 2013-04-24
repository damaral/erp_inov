# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :os do
    data_entrega "2013-04-23"
    observacao "MyText"
    desconto 1.5
    valor_restante 1.5
    valor_total 1.5
    arquivo "MyString"
    estado "MyString"
    prioridade 1
    esta_pago false
  end
end
