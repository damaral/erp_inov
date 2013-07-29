require 'spec_helper'

describe "faturas/show" do
  before(:each) do
    @fatura = assign(:fatura, stub_model(Fatura,
      :descricao => "MyText",
      :valor => 1.5,
      :multa => 1.5,
      :esta_pago => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/false/)
  end
end
