require 'spec_helper'

describe "empresas/edit" do
  before(:each) do
    @empresa = assign(:empresa, stub_model(Empresa,
      :nome => "MyString",
      :nome_fantasia => "MyString",
      :cnpj => "MyString",
      :endereco => "MyString",
      :bairro => "MyString",
      :complemento => "MyString",
      :cep => "MyString",
      :cidade => "MyString",
      :estado => "MyString",
      :telefone => "MyString",
      :observacao => "MyText"
    ))
  end

  it "renders the edit empresa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", empresa_path(@empresa), "post" do
      assert_select "input#empresa_nome[name=?]", "empresa[nome]"
      assert_select "input#empresa_nome_fantasia[name=?]", "empresa[nome_fantasia]"
      assert_select "input#empresa_cnpj[name=?]", "empresa[cnpj]"
      assert_select "input#empresa_endereco[name=?]", "empresa[endereco]"
      assert_select "input#empresa_bairro[name=?]", "empresa[bairro]"
      assert_select "input#empresa_complemento[name=?]", "empresa[complemento]"
      assert_select "input#empresa_cep[name=?]", "empresa[cep]"
      assert_select "input#empresa_cidade[name=?]", "empresa[cidade]"
      assert_select "input#empresa_estado[name=?]", "empresa[estado]"
      assert_select "input#empresa_telefone[name=?]", "empresa[telefone]"
      assert_select "textarea#empresa_observacao[name=?]", "empresa[observacao]"
    end
  end
end
