# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130423223547) do

  create_table "acoes", :force => true do |t|
    t.string   "acao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "apelido"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "complemento"
    t.string   "cep"
    t.string   "cidade"
    t.string   "estado"
    t.string   "telefone"
    t.string   "celular"
    t.string   "email"
    t.string   "cpf"
    t.string   "rg"
    t.text     "observacao"
    t.integer  "empresa_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "clientes", ["empresa_id"], :name => "index_clientes_on_empresa_id"

  create_table "empresas", :force => true do |t|
    t.string   "nome"
    t.string   "nome_fantasia"
    t.string   "cnpj"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "complemento"
    t.string   "cep"
    t.string   "cidade"
    t.string   "estado"
    t.string   "telefone"
    t.text     "observacao"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "funcionarios", :force => true do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "complemento"
    t.string   "cep"
    t.string   "cidade"
    t.string   "estado"
    t.string   "telefone"
    t.string   "celular"
    t.string   "email"
    t.string   "rg"
    t.string   "cargo"
    t.date     "data_admissao"
    t.date     "data_demissao"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "itens", :force => true do |t|
    t.integer  "quantidade"
    t.text     "descricao"
    t.float    "sub_total"
    t.float    "altura"
    t.float    "comprimento"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "oss", :force => true do |t|
    t.date     "data_entrega"
    t.text     "observacao"
    t.float    "desconto"
    t.float    "valor_restante"
    t.float    "valor_total"
    t.string   "arquivo"
    t.string   "estado"
    t.integer  "prioridade"
    t.boolean  "esta_pago"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "pagamentos", :force => true do |t|
    t.float    "valor"
    t.string   "tipo"
    t.string   "forma_de_pagamento"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "produtos", :force => true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.string   "unidade"
    t.float    "preco_unitario"
    t.float    "custo_unitario"
    t.float    "altura"
    t.float    "comprimento"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
