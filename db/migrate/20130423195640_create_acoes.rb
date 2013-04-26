class CreateAcoes < ActiveRecord::Migration
  def change
    create_table :acoes do |t|
      t.string :acao

      t.references :os
      t.references :funcionario

      t.timestamps
    end

    add_index :acoes, :os_id
    add_index :acoes, :funcionario_id
  end
end
