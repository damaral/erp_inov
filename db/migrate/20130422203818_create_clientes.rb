class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :apelido
      t.string :endereco
      t.string :bairro
      t.string :complemento
      t.string :cep
      t.string :cidade
      t.string :estado
      t.string :telefone
      t.string :celular
      t.string :email
      t.string :cpf
      t.string :rg
      t.text :observacao

      t.references :empresa

      t.timestamps
    end

    add_index :clientes, :empresa_id
  end
end
