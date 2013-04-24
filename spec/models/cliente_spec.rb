require 'spec_helper'

describe Cliente do
  let(:cliente) {FactoryGirl.create(:cliente)}

  it "Deve ser instanciavel" do
    Cliente.new.should be_an_instance_of(Cliente)
  end

  it "Deve ser persistente" do
    cliente = FactoryGirl.create(:cliente)
    cliente.should be_persisted
  end

  it "Deve possuir um nome" do
    cliente.nome = nil
    cliente.should_not be_valid
  end

  it "Deve possuir um telefone" do
    cliente.telefone = nil
    cliente.should_not be_valid
  end

  ['email', 'email@', 'email@email', '.com'].each_with_index do |email_invalido, i|
    it "Deve ter um email valido - #{i} / #{email_invalido}" do
      cliente.email = email_invalido

      cliente.should_not be_valid
    end
  end
  
end
