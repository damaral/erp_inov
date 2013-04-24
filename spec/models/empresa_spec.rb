require 'spec_helper'

describe Empresa do
  let(:empresa) {FactoryGirl.create(:empresa)}

  it "Deve ser instanciavel" do
    Empresa.new.should be_an_instance_of(Empresa)
  end

  it "Deve ser persistente" do
    empresa = FactoryGirl.create(:empresa)
    empresa.should be_persisted
  end

  it "Deve possuir um nome" do
    empresa.nome = nil
    empresa.should_not be_valid
  end

  it "Deve possuir um nome_fantasia" do
    empresa.nome_fantasia = nil
    empresa.should_not be_valid
  end

  it "Deve possuir um cnpj" do
    empresa.cnpj = nil
    empresa.should_not be_valid
  end

  it "Deve possuir um telefone" do
    empresa.telefone = nil
    empresa.should_not be_valid
  end
end
