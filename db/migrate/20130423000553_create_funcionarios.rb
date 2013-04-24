class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :sobrenome
      t.string :endereco
      t.string :bairro
      t.string :complemento
      t.string :cep
      t.string :cidade
      t.string :estado
      t.string :telefone
      t.string :celular
      t.string :email
      t.string :rg
      t.string :cargo
      t.date :data_admissao
      t.date :data_demissao

      t.timestamps
    end
  end
end
