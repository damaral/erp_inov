require 'spec_helper'

describe Produto do
  let(:produto) {FactoryGirl.create(:produto)}

  it "Deve ser instanciavel" do
    Produto.new.should be_an_instance_of(Produto)
  end

  it "Deve ser persistente" do
    produto = FactoryGirl.create(:produto)
    produto.should be_persisted
  end

  it "Deve possuir um nome" do
    produto.nome = nil
    produto.should_not be_valid
  end

  it "Deve possuir um preco_unitario" do
    produto.preco_unitario = nil
    produto.should_not be_valid
  end

  it "Deve possuir um preco_unitario maior que zero" do
    produto.preco_unitario = -8
    produto.should_not be_valid
  end

  it "Deve possuir um custo_unitario" do
    produto.custo_unitario = nil
    produto.should_not be_valid
  end

  it "Deve possuir um custo_unitario maior que zero" do
    produto.custo_unitario = -89
    produto.should_not be_valid
  end

  [nil, '', ' ', 'qqrcoisa'].each_with_index do |unidade_invalida, i|
    it "Deve ter uma unidade valida - INVALIDO - #{i} / #{unidade_invalida}" do
      produto.unidade = unidade_invalida

      produto.should_not be_valid
    end
  end

  Produto::UNIDADES.each_with_index do |unidade_valida, i|
    it "Deve ter uma unidade valida - VALIDO - #{i} / #{unidade_valida}" do
      produto.unidade = unidade_valida

      produto.should be_valid
    end
  end
end
