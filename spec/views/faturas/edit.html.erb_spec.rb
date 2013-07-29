require 'spec_helper'

describe "faturas/edit" do
  before(:each) do
    @fatura = assign(:fatura, stub_model(Fatura,
      :descricao => "MyText",
      :valor => 1.5,
      :multa => 1.5,
      :esta_pago => false
    ))
  end

  it "renders the edit fatura form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fatura_path(@fatura), "post" do
      assert_select "textarea#fatura_descricao[name=?]", "fatura[descricao]"
      assert_select "input#fatura_valor[name=?]", "fatura[valor]"
      assert_select "input#fatura_multa[name=?]", "fatura[multa]"
      assert_select "input#fatura_esta_pago[name=?]", "fatura[esta_pago]"
    end
  end
end
