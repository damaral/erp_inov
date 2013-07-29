require 'spec_helper'

describe "fornecedores/edit" do
  before(:each) do
    @fornecedor = assign(:fornecedor, stub_model(Fornecedor,
      :nome => "MyString",
      :cnpj => "MyString",
      :endereco => "MyString",
      :bairro => "MyString",
      :complemento => "MyString",
      :cep => "MyString",
      :cidade => "MyString",
      :estado => "MyString",
      :telefone => "MyString",
      :observacao => "MyString",
      :tipo => 1
    ))
  end

  it "renders the edit fornecedor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fornecedor_path(@fornecedor), "post" do
      assert_select "input#fornecedor_nome[name=?]", "fornecedor[nome]"
      assert_select "input#fornecedor_cnpj[name=?]", "fornecedor[cnpj]"
      assert_select "input#fornecedor_endereco[name=?]", "fornecedor[endereco]"
      assert_select "input#fornecedor_bairro[name=?]", "fornecedor[bairro]"
      assert_select "input#fornecedor_complemento[name=?]", "fornecedor[complemento]"
      assert_select "input#fornecedor_cep[name=?]", "fornecedor[cep]"
      assert_select "input#fornecedor_cidade[name=?]", "fornecedor[cidade]"
      assert_select "input#fornecedor_estado[name=?]", "fornecedor[estado]"
      assert_select "input#fornecedor_telefone[name=?]", "fornecedor[telefone]"
      assert_select "input#fornecedor_observacao[name=?]", "fornecedor[observacao]"
      assert_select "input#fornecedor_tipo[name=?]", "fornecedor[tipo]"
    end
  end
end
