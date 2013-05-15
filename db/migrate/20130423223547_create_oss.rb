class CreateOss < ActiveRecord::Migration
  def change
    create_table :oss do |t|
      t.date :data_entrega
      t.date :previsao_entrega
      t.text :observacao
      t.string :arquivo
      t.integer :estado
      t.string :aprovado_por
      t.boolean :esta_pago

      t.references :cliente

      t.timestamps
    end

    add_index :oss, :cliente_id
  end
end
