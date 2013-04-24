require 'spec_helper'

describe "empresas/index" do
  before(:each) do
    assign(:empresas, [
      stub_model(Empresa,
        :nome => "Nome",
        :nome_fantasia => "Nome Fantasia",
        :cnpj => "Cnpj",
        :endereco => "Endereco",
        :bairro => "Bairro",
        :complemento => "Complemento",
        :cep => "Cep",
        :cidade => "Cidade",
        :estado => "Estado",
        :telefone => "Telefone",
        :observacao => "MyText"
      ),
      stub_model(Empresa,
        :nome => "Nome",
        :nome_fantasia => "Nome Fantasia",
        :cnpj => "Cnpj",
        :endereco => "Endereco",
        :bairro => "Bairro",
        :complemento => "Complemento",
        :cep => "Cep",
        :cidade => "Cidade",
        :estado => "Estado",
        :telefone => "Telefone",
        :observacao => "MyText"
      )
    ])
  end

  it "renders a list of empresas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Nome Fantasia".to_s, :count => 2
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "Endereco".to_s, :count => 2
    assert_select "tr>td", :text => "Bairro".to_s, :count => 2
    assert_select "tr>td", :text => "Complemento".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
