require 'spec_helper'

describe "pagamentos/index" do
  before(:each) do
    assign(:pagamentos, [
      stub_model(Pagamento,
        :valor => 1.5,
        :tipo => "Tipo",
        :forma_de_pagamento => "Forma De Pagamento"
      ),
      stub_model(Pagamento,
        :valor => 1.5,
        :tipo => "Tipo",
        :forma_de_pagamento => "Forma De Pagamento"
      )
    ])
  end

  it "renders a list of pagamentos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Tipo".to_s, :count => 2
    assert_select "tr>td", :text => "Forma De Pagamento".to_s, :count => 2
  end
end
