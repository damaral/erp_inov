require 'spec_helper'

describe "oss/new" do
  before(:each) do
    assign(:os, stub_model(Os,
      :observacao => "MyText",
      :desconto => 1.5,
      :valor_restante => 1.5,
      :valor_total => 1.5,
      :arquivo => "MyString",
      :estado => "MyString",
      :prioridade => 1,
      :esta_pago => false
    ).as_new_record)
  end

  it "renders new os form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", oss_path, "post" do
      assert_select "textarea#os_observacao[name=?]", "os[observacao]"
      assert_select "input#os_desconto[name=?]", "os[desconto]"
      assert_select "input#os_valor_restante[name=?]", "os[valor_restante]"
      assert_select "input#os_valor_total[name=?]", "os[valor_total]"
      assert_select "input#os_arquivo[name=?]", "os[arquivo]"
      assert_select "input#os_estado[name=?]", "os[estado]"
      assert_select "input#os_prioridade[name=?]", "os[prioridade]"
      assert_select "input#os_esta_pago[name=?]", "os[esta_pago]"
    end
  end
end
