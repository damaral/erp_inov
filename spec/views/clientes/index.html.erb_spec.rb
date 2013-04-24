require 'spec_helper'

describe "clientes/index" do
  before(:each) do
    assign(:clientes, [
      stub_model(Cliente,
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
      ),
      stub_model(Cliente,
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
      )
    ])
  end

  it "renders a list of clientes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Sobrenome".to_s, :count => 2
    assert_select "tr>td", :text => "Apelido".to_s, :count => 2
    assert_select "tr>td", :text => "Endereco".to_s, :count => 2
    assert_select "tr>td", :text => "Bairro".to_s, :count => 2
    assert_select "tr>td", :text => "Complemento".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Celular".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
