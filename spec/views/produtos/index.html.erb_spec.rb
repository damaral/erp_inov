require 'spec_helper'

describe "produtos/index" do
  before(:each) do
    assign(:produtos, [
      stub_model(Produto,
        :nome => "Nome",
        :descricao => "MyText",
        :unidade => "Unidade",
        :preco_unitario => 1.5,
        :custo_unitario => 1.5,
        :altura => 1.5,
        :comprimento => 1.5
      ),
      stub_model(Produto,
        :nome => "Nome",
        :descricao => "MyText",
        :unidade => "Unidade",
        :preco_unitario => 1.5,
        :custo_unitario => 1.5,
        :altura => 1.5,
        :comprimento => 1.5
      )
    ])
  end

  it "renders a list of produtos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Unidade".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
