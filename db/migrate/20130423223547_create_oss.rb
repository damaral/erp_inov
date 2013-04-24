class CreateOss < ActiveRecord::Migration
  def change
    create_table :oss do |t|
      t.date :data_entrega
      t.text :observacao
      t.float :desconto
      t.float :valor_restante
      t.float :valor_total
      t.string :arquivo
      t.string :estado
      t.integer :prioridade
      t.boolean :esta_pago

      t.timestamps
    end
  end
end
