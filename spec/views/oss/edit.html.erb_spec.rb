require 'spec_helper'

describe "oss/edit" do
  before(:each) do
    @os = assign(:os, stub_model(Os,
      :observacao => "MyText",
      :desconto => 1.5,
      :valor_restante => 1.5,
      :valor_total => 1.5,
      :arquivo => "MyString",
      :estado => "MyString",
      :prioridade => 1,
      :esta_pago => false
    ))
  end

  it "renders the edit os form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", os_path(@os), "post" do
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
