# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :empresa do
    nome "MyString"
    nome_fantasia "MyString"
    cnpj "MyString"
    endereco "MyString"
    bairro "MyString"
    complemento "MyString"
    cep "MyString"
    cidade "MyString"
    estado "MyString"
    telefone "MyString"
    observacao "MyText"
  end
end
