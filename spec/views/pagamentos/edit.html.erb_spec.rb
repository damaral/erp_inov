require 'spec_helper'

describe "pagamentos/edit" do
  before(:each) do
    @pagamento = assign(:pagamento, stub_model(Pagamento,
      :valor => 1.5,
      :tipo => "MyString",
      :forma_de_pagamento => "MyString"
    ))
  end

  it "renders the edit pagamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pagamento_path(@pagamento), "post" do
      assert_select "input#pagamento_valor[name=?]", "pagamento[valor]"
      assert_select "input#pagamento_tipo[name=?]", "pagamento[tipo]"
      assert_select "input#pagamento_forma_de_pagamento[name=?]", "pagamento[forma_de_pagamento]"
    end
  end
end
