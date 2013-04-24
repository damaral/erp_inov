require 'spec_helper'

describe "funcionarios/index" do
  before(:each) do
    assign(:funcionarios, [
      stub_model(Funcionario,
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
      ),
      stub_model(Funcionario,
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
      )
    ])
  end

  it "renders a list of funcionarios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Sobrenome".to_s, :count => 2
    assert_select "tr>td", :text => "Endereco".to_s, :count => 2
    assert_select "tr>td", :text => "Bairro".to_s, :count => 2
    assert_select "tr>td", :text => "Complemento".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Celular".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Cargo".to_s, :count => 2
  end
end
