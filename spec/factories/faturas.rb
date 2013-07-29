# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fatura do
    data_prevista "2013-07-22"
    descricao "MyText"
    valor 1.5
    multa 1.5
    esta_pago false
  end
end
