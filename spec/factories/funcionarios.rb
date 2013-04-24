# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :funcionario do
    nome "MyString"
    sobrenome "MyString"
    endereco "MyString"
    bairro "MyString"
    complemento "MyString"
    cep "MyString"
    cidade "MyString"
    estado "MyString"
    telefone "MyString"
    celular "MyString"
    email "email@email.com.br"
    rg "MyString"
    cargo "MyString"
    data_admissao "2013-04-22"
    data_demissao "2013-04-22"
  end
end
