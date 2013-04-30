# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Daniel", "João", "Maria", "Pedro", "Fábio", "Manoel", "André"].each do |nome|
  FactoryGirl.create(:cliente, :nome => nome)
end

FactoryGirl.create(:produto, :nome => "Faixa 70 cm", :unidade => Produto::METRO_COMP, :preco_unitario => 25, :custo_unitario => 10, :altura => 70)
FactoryGirl.create(:produto, :nome => "Banner 100 cm x 70 cm", :unidade => Produto::PECA, :preco_unitario => 40, :custo_unitario => 25, :altura => 100, :comprimento => 70)
FactoryGirl.create(:produto, :nome => "Placa Imobiliária 40 cm x 50 cm", :unidade => Produto::PECA, :preco_unitario => 15, :custo_unitario => 8, :altura => 40, :comprimento => 50)

["Autometal", "Flasa", "Dana Nakata", "General Motors"].each do |nome|
  FactoryGirl.create(:empresa, :nome => nome)
end