# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    quantidade 1
    descricao "MyText"
    altura 1.5
    comprimento 1.5
    tipo Item::IMPRESSAO
    desconto 0
    produto
  end
end
