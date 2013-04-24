# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :produto do
    nome "MyString"
    descricao "MyText"
    unidade Produto::PECA
    preco_unitario 1.5
    custo_unitario 1.5
    altura 1.5
    comprimento 1.5
  end
end
