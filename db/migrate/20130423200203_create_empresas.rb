class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :nome_fantasia
      t.string :cnpj
      t.string :endereco
      t.string :bairro
      t.string :complemento
      t.string :cep
      t.string :cidade
      t.string :estado
      t.string :telefone
      t.text :observacao

      t.timestamps
    end
  end
end
