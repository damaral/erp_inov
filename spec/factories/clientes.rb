# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cliente do
    nome "MyString"
    apelido "MyString"
    endereco "MyString"
    bairro "MyString"
    complemento "MyString"
    cep "MyString"
    cidade "MyString"
    estado "MyString"
    telefone "MyString"
    celular "MyString"
    email "email@email.com"
    cpf "MyString"
    rg "MyString"
    observacao "MyText"
  end
end
