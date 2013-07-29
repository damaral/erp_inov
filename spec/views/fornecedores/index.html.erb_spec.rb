require 'spec_helper'

describe "fornecedores/index" do
  before(:each) do
    assign(:fornecedores, [
      stub_model(Fornecedor,
        :nome => "Nome",
        :cnpj => "Cnpj",
        :endereco => "Endereco",
        :bairro => "Bairro",
        :complemento => "Complemento",
        :cep => "Cep",
        :cidade => "Cidade",
        :estado => "Estado",
        :telefone => "Telefone",
        :observacao => "Observacao",
        :tipo => 1
      ),
      stub_model(Fornecedor,
        :nome => "Nome",
        :cnpj => "Cnpj",
        :endereco => "Endereco",
        :bairro => "Bairro",
        :complemento => "Complemento",
        :cep => "Cep",
        :cidade => "Cidade",
        :estado => "Estado",
        :telefone => "Telefone",
        :observacao => "Observacao",
        :tipo => 1
      )
    ])
  end

  it "renders a list of fornecedores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "Endereco".to_s, :count => 2
    assert_select "tr>td", :text => "Bairro".to_s, :count => 2
    assert_select "tr>td", :text => "Complemento".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Observacao".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
