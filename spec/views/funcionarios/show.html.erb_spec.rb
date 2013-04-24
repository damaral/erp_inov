require 'spec_helper'

describe "funcionarios/show" do
  before(:each) do
    @funcionario = assign(:funcionario, stub_model(Funcionario,
      :nome => "Nome",
      :sobrenome => "Sobrenome",
      :endereco => "Endereco",
      :bairro => "Bairro",
      :complemento => "Complemento",
      :cep => "Cep",
      :cidade => "Cidade",
      :estado => "Estado",
      :telefone => "Telefone",
      :celular => "Celular",
      :email => "Email",
      :rg => "Rg",
      :cargo => "Cargo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Sobrenome/)
    rendered.should match(/Endereco/)
    rendered.should match(/Bairro/)
    rendered.should match(/Complemento/)
    rendered.should match(/Cep/)
    rendered.should match(/Cidade/)
    rendered.should match(/Estado/)
    rendered.should match(/Telefone/)
    rendered.should match(/Celular/)
    rendered.should match(/Email/)
    rendered.should match(/Rg/)
    rendered.should match(/Cargo/)
  end
end
