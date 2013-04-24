require 'spec_helper'

describe "clientes/show" do
  before(:each) do
    @cliente = assign(:cliente, stub_model(Cliente,
      :nome => "Nome",
      :sobrenome => "Sobrenome",
      :apelido => "Apelido",
      :endereco => "Endereco",
      :bairro => "Bairro",
      :complemento => "Complemento",
      :cep => "Cep",
      :cidade => "Cidade",
      :estado => "Estado",
      :telefone => "Telefone",
      :celular => "Celular",
      :email => "Email",
      :cpf => "Cpf",
      :rg => "Rg",
      :observacao => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Sobrenome/)
    rendered.should match(/Apelido/)
    rendered.should match(/Endereco/)
    rendered.should match(/Bairro/)
    rendered.should match(/Complemento/)
    rendered.should match(/Cep/)
    rendered.should match(/Cidade/)
    rendered.should match(/Estado/)
    rendered.should match(/Telefone/)
    rendered.should match(/Celular/)
    rendered.should match(/Email/)
    rendered.should match(/Cpf/)
    rendered.should match(/Rg/)
    rendered.should match(/MyText/)
  end
end
