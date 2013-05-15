require 'spec_helper'

describe Item do
  let(:item) {FactoryGirl.create(:item)}

  it "Deve ser instanciavel" do
    Item.new.should be_an_instance_of(Item)
  end

  it "Deve ser persistente" do
    item = FactoryGirl.create(:item)
    item.should be_persisted
  end

  it "Deve possuir quantidade > 0" do
    item.quantidade = -2
    item.should_not be_valid
  end

  it "Deve possuir altura > 0" do
    item.altura = -2
    item.should_not be_valid
  end

  it "Deve possuir comprimento > 0" do
    item.comprimento = -2
    item.should_not be_valid
  end

  it "Deve possuir um produto" do
    item.produto = nil
    item.should_not be_valid
  end
end
