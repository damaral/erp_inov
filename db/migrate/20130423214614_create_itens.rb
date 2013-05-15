class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
      t.integer :quantidade
      t.text :descricao
      t.float :altura
      t.float :comprimento
      t.string :tipo
      t.float :desconto

      t.references :produto
      t.references :os

      t.timestamps
    end

    add_index :itens, :produto_id
    add_index :itens, :os_id
  end
end
