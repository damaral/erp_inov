require 'spec_helper'

describe "empresas/show" do
  before(:each) do
    @empresa = assign(:empresa, stub_model(Empresa,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Nome Fantasia/)
    rendered.should match(/Cnpj/)
    rendered.should match(/Endereco/)
    rendered.should match(/Bairro/)
    rendered.should match(/Complemento/)
    rendered.should match(/Cep/)
    rendered.should match(/Cidade/)
    rendered.should match(/Estado/)
    rendered.should match(/Telefone/)
    rendered.should match(/MyText/)
  end
end
