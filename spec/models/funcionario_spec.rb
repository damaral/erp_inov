require 'spec_helper'

describe Funcionario do
  let(:funcionario) {FactoryGirl.create(:funcionario)}

  it "Deve ser instanciavel" do
    Funcionario.new.should be_an_instance_of(Funcionario)
  end

  it "Deve ser persistente" do
    funcionario = FactoryGirl.create(:funcionario)
    funcionario.should be_persisted
  end

  it "Deve possuir um nome" do
    funcionario.nome = nil
    funcionario.should_not be_valid
  end

  it "Deve possuir um sobrenome" do
    funcionario.sobrenome = nil
    funcionario.should_not be_valid
  end

  it "Deve possuir um telefone" do
    funcionario.telefone = nil
    funcionario.should_not be_valid
  end

  it "Deve possuir um data_admissao" do
    funcionario.data_admissao = nil
    funcionario.should_not be_valid
  end

  ['email', 'email@', 'email@email', '.com'].each_with_index do |email_invalido, i|
    it "Deve ter um email valido - #{i} / #{email_invalido}" do
      funcionario.email = email_invalido

      funcionario.should_not be_valid
    end
  end
end
