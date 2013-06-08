# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Daniel Amaral de Sousa", 
 "João Perreira dos Santos", 
 "Maria Joaquina Barreto", 
 "Pedro de Assis", 
"Adérito Almeyda",
"Alípio Gonçalves",
"Antão Abrantes",
"Armanda Grillo",
"Augusta Gómez",
"Benedito Simão",
"Cauê González",
"Claudemiro Rufino",
"Eduardo Araújo",
"Elisabete Cabeza de Vaca",
"Emiliano Sabala",
"Emílio Figueroa",
"Feliciana Cordeiro",
"Feliciano Rosa",
"Flora Palmeira",
"Flávia Aranha",
"Glória Milheiro",
"Guaraci Magalhães",
"Gávio Quintais",
"Hélio Ferreira",
"Iberê Capistrano",
"Ilma Proença",
"Ingrit Monforte",
"Inácio Pimenta",
"Israel Rosario",
"Iuri Marañón",
"Joana Vilalobos",
"Justino Trindade",
"Mamede Guterres",
"Marisa Frade",
"Maurício Naves",
"Milu Vilas-Boas",
"Moema Losada",
"Mécia Novaes",
"Natália Mexia",
"Natália Tavera",
"Porfírio Bulhões",
"Ramiro Sousa",
"Renata Caiado",
"Sabino Quintana",
"Santiago Brión",
"Sara Machado",
"Sidónio Collaço",
"Sílvio Faia",
"Teodoro Manso",
"Tobias Figueiró",
"Tércio Leite",
"Ubirajara Guimarães",
"Virgínia Galvão",
"Vivaldo Sintra"].each do |nome|
  FactoryGirl.create(:cliente, :nome => nome)
end

FactoryGirl.create(:produto, :nome => "Faixa 70 cm", :unidade => Produto::METRO_COMP, :preco_unitario => 25, :custo_unitario => 10, :altura => 70)
FactoryGirl.create(:produto, :nome => "Banner 100 cm x 70 cm", :unidade => Produto::PECA, :preco_unitario => 40, :custo_unitario => 25, :altura => 100, :comprimento => 70)
FactoryGirl.create(:produto, :nome => "Placa Imobiliária 40 cm x 50 cm", :unidade => Produto::PECA, :preco_unitario => 15, :custo_unitario => 8, :altura => 40, :comprimento => 50)

["Autometal", "Flasa", "Dana Nakata", "General Motors"].each do |nome|
  FactoryGirl.create(:empresa, :nome => nome)
end

50.times do |i|
  cliente = Cliente.find(i.next)
  os = FactoryGirl.create(:os, :cliente => cliente, :aprovado_por => Os::GERENCIA)
  FactoryGirl.create(:item, :produto => Produto.first, :quantidade => i.next, :altura => 70, :comprimento => 100*i.next, :os => os)
  FactoryGirl.create(:pagamento, :cliente => cliente, :os => os)
end

Os.all.each do |os|
  os.atualiza_esta_pago
end

FactoryGirl.create(:funcionario, :nome => "Solange Amaral de Sousa", :email => "logos.inov@hotmail.com", :password => "inov1234", :roles_mask => 1)