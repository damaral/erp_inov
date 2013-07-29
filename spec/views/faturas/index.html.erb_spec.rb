require 'spec_helper'

describe "faturas/index" do
  before(:each) do
    assign(:faturas, [
      stub_model(Fatura,
        :descricao => "MyText",
        :valor => 1.5,
        :multa => 1.5,
        :esta_pago => false
      ),
      stub_model(Fatura,
        :descricao => "MyText",
        :valor => 1.5,
        :multa => 1.5,
        :esta_pago => false
      )
    ])
  end

  it "renders a list of faturas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
