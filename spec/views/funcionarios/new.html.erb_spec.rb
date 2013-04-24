require 'spec_helper'

describe "funcionarios/new" do
  before(:each) do
    assign(:funcionario, stub_model(Funcionario,
      :nome => "MyString",
      :sobrenome => "MyString",
      :endereco => "MyString",
      :bairro => "MyString",
      :complemento => "MyString",
      :cep => "MyString",
      :cidade => "MyString",
      :estado => "MyString",
      :telefone => "MyString",
      :celular => "MyString",
      :email => "MyString",
      :rg => "MyString",
      :cargo => "MyString"
    ).as_new_record)
  end

  it "renders new funcionario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", funcionarios_path, "post" do
      assert_select "input#funcionario_nome[name=?]", "funcionario[nome]"
      assert_select "input#funcionario_sobrenome[name=?]", "funcionario[sobrenome]"
      assert_select "input#funcionario_endereco[name=?]", "funcionario[endereco]"
      assert_select "input#funcionario_bairro[name=?]", "funcionario[bairro]"
      assert_select "input#funcionario_complemento[name=?]", "funcionario[complemento]"
      assert_select "input#funcionario_cep[name=?]", "funcionario[cep]"
      assert_select "input#funcionario_cidade[name=?]", "funcionario[cidade]"
      assert_select "input#funcionario_estado[name=?]", "funcionario[estado]"
      assert_select "input#funcionario_telefone[name=?]", "funcionario[telefone]"
      assert_select "input#funcionario_celular[name=?]", "funcionario[celular]"
      assert_select "input#funcionario_email[name=?]", "funcionario[email]"
      assert_select "input#funcionario_rg[name=?]", "funcionario[rg]"
      assert_select "input#funcionario_cargo[name=?]", "funcionario[cargo]"
    end
  end
end
