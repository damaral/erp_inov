class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.float :valor
      t.string :forma_de_pagamento
      t.date :data_prevista
      t.boolean :esta_pago

      t.references :cliente
      t.references :os

      t.timestamps
    end

    add_index :pagamentos, :os_id
    add_index :pagamentos, :cliente_id
  end
end
