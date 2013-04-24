class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.float :valor
      t.string :tipo
      t.string :forma_de_pagamento

      t.timestamps
    end
  end
end
