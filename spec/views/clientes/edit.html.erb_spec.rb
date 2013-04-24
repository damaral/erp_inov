require 'spec_helper'

describe "clientes/edit" do
  before(:each) do
    @cliente = assign(:cliente, stub_model(Cliente,
      :nome => "MyString",
      :sobrenome => "MyString",
      :apelido => "MyString",
      :endereco => "MyString",
      :bairro => "MyString",
      :complemento => "MyString",
      :cep => "MyString",
      :cidade => "MyString",
      :estado => "MyString",
      :telefone => "MyString",
      :celular => "MyString",
      :email => "MyString",
      :cpf => "MyString",
      :rg => "MyString",
      :observacao => "MyText"
    ))
  end

  it "renders the edit cliente form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cliente_path(@cliente), "post" do
      assert_select "input#cliente_nome[name=?]", "cliente[nome]"
      assert_select "input#cliente_sobrenome[name=?]", "cliente[sobrenome]"
      assert_select "input#cliente_apelido[name=?]", "cliente[apelido]"
      assert_select "input#cliente_endereco[name=?]", "cliente[endereco]"
      assert_select "input#cliente_bairro[name=?]", "cliente[bairro]"
      assert_select "input#cliente_complemento[name=?]", "cliente[complemento]"
      assert_select "input#cliente_cep[name=?]", "cliente[cep]"
      assert_select "input#cliente_cidade[name=?]", "cliente[cidade]"
      assert_select "input#cliente_estado[name=?]", "cliente[estado]"
      assert_select "input#cliente_telefone[name=?]", "cliente[telefone]"
      assert_select "input#cliente_celular[name=?]", "cliente[celular]"
      assert_select "input#cliente_email[name=?]", "cliente[email]"
      assert_select "input#cliente_cpf[name=?]", "cliente[cpf]"
      assert_select "input#cliente_rg[name=?]", "cliente[rg]"
      assert_select "textarea#cliente_observacao[name=?]", "cliente[observacao]"
    end
  end
end
