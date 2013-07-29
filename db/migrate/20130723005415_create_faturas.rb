class CreateFaturas < ActiveRecord::Migration
  def change
    create_table :faturas do |t|
      t.date :data_prevista
      t.text :descricao
      t.float :valor
      t.float :multa, :default => 0
      t.boolean :esta_pago

      t.references :funcionario
      t.references :fornecedor

      t.timestamps
    end

    add_index :faturas, :funcionario_id
    add_index :faturas, :fornecedor_id
  end
end
