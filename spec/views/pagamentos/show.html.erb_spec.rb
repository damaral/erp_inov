require 'spec_helper'

describe "pagamentos/show" do
  before(:each) do
    @pagamento = assign(:pagamento, stub_model(Pagamento,
      :valor => 1.5,
      :tipo => "Tipo",
      :forma_de_pagamento => "Forma De Pagamento"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/Tipo/)
    rendered.should match(/Forma De Pagamento/)
  end
end
