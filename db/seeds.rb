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

FactoryGirl.create(:produto, :nome => "Faixa 70 cm", :unidade => Produto::METRO_COMP, :preco_unitario => 25, :custo_unitario => 10, :altura => 0.7)