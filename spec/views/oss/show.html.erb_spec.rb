require 'spec_helper'

describe "oss/show" do
  before(:each) do
    @os = assign(:os, stub_model(Os,
      :observacao => "MyText",
      :desconto => 1.5,
      :valor_restante => 1.5,
      :valor_total => 1.5,
      :arquivo => "Arquivo",
      :estado => "Estado",
      :prioridade => 1,
      :esta_pago => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/Arquivo/)
    rendered.should match(/Estado/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end
