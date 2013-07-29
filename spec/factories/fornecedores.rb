# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fornecedor do
    nome "MyString"
    cnpj "MyString"
    endereco "MyString"
    bairro "MyString"
    complemento "MyString"
    cep "MyString"
    cidade "MyString"
    estado "MyString"
    telefone "MyString"
    observacao "MyString"
    tipo 1
  end
end
