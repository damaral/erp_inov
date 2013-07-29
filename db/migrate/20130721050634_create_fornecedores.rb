class CreateFornecedores < ActiveRecord::Migration
  def change
    create_table :fornecedores do |t|
      t.string :nome
      t.string :cnpj
      t.string :endereco
      t.string :bairro
      t.string :complemento
      t.string :cep
      t.string :cidade
      t.string :estado
      t.string :telefone
      t.string :observacao
      t.integer :tipo

      t.timestamps
    end
  end
end
