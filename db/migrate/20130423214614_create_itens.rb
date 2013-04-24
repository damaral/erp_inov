class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
      t.integer :quantidade
      t.text :descricao
      t.float :sub_total
      t.float :altura
      t.float :comprimento

      t.timestamps
    end
  end
end
