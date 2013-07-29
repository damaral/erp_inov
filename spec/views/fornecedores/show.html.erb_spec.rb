require 'spec_helper'

describe "fornecedores/show" do
  before(:each) do
    @fornecedor = assign(:fornecedor, stub_model(Fornecedor,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Cnpj/)
    rendered.should match(/Endereco/)
    rendered.should match(/Bairro/)
    rendered.should match(/Complemento/)
    rendered.should match(/Cep/)
    rendered.should match(/Cidade/)
    rendered.should match(/Estado/)
    rendered.should match(/Telefone/)
    rendered.should match(/Observacao/)
    rendered.should match(/1/)
  end
end
