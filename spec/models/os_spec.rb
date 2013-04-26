require 'spec_helper'

describe Os do
  let(:os) {FactoryGirl.create(:os)}

  it "Deve ser instanciavel" do
    Os.new.should be_an_instance_of(Os)
  end

  it "Deve ser persistente" do
    os = FactoryGirl.create(:os)
    os.should be_persisted
  end

  it "Deve possuir valor_total > 0" do
    os.valor_total = -9
    os.should_not be_valid
  end

  it "Deve possuir valor_restante >= 0" do
    os.valor_restante = -9
    os.should_not be_valid
  end

  it "Deve possuir desconto >= 0" do
    os.desconto = -9
    os.should_not be_valid
  end
end
