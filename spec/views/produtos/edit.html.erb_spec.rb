require 'spec_helper'

describe "produtos/edit" do
  before(:each) do
    @produto = assign(:produto, stub_model(Produto,
      :nome => "MyString",
      :descricao => "MyText",
      :unidade => "MyString",
      :preco_unitario => 1.5,
      :custo_unitario => 1.5,
      :altura => 1.5,
      :comprimento => 1.5
    ))
  end

  it "renders the edit produto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", produto_path(@produto), "post" do
      assert_select "input#produto_nome[name=?]", "produto[nome]"
      assert_select "textarea#produto_descricao[name=?]", "produto[descricao]"
      assert_select "input#produto_unidade[name=?]", "produto[unidade]"
      assert_select "input#produto_preco_unitario[name=?]", "produto[preco_unitario]"
      assert_select "input#produto_custo_unitario[name=?]", "produto[custo_unitario]"
      assert_select "input#produto_altura[name=?]", "produto[altura]"
      assert_select "input#produto_comprimento[name=?]", "produto[comprimento]"
    end
  end
end
