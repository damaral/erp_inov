require 'spec_helper'

describe "oss/index" do
  before(:each) do
    assign(:oss, [
      stub_model(Os,
        :observacao => "MyText",
        :desconto => 1.5,
        :valor_restante => 1.5,
        :valor_total => 1.5,
        :arquivo => "Arquivo",
        :estado => "Estado",
        :prioridade => 1,
        :esta_pago => false
      ),
      stub_model(Os,
        :observacao => "MyText",
        :desconto => 1.5,
        :valor_restante => 1.5,
        :valor_total => 1.5,
        :arquivo => "Arquivo",
        :estado => "Estado",
        :prioridade => 1,
        :esta_pago => false
      )
    ])
  end

  it "renders a list of oss" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Arquivo".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
