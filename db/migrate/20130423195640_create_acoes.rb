class CreateAcoes < ActiveRecord::Migration
  def change
    create_table :acoes do |t|
      t.string :acao
      t.text :comentario

      t.references :os
      t.references :funcionario
      t.references :cliente

      t.timestamps
    end

    add_index :acoes, :os_id
    add_index :acoes, :funcionario_id
    add_index :acoes, :cliente_id
  end
end
