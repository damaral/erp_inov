require 'spec_helper'

describe "produtos/show" do
  before(:each) do
    @produto = assign(:produto, stub_model(Produto,
      :nome => "Nome",
      :descricao => "MyText",
      :unidade => "Unidade",
      :preco_unitario => 1.5,
      :custo_unitario => 1.5,
      :altura => 1.5,
      :comprimento => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/MyText/)
    rendered.should match(/Unidade/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
