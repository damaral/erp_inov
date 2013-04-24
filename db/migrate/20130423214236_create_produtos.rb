class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.string :unidade
      t.float :preco_unitario
      t.float :custo_unitario
      t.float :altura
      t.float :comprimento

      t.timestamps
    end
  end
end
