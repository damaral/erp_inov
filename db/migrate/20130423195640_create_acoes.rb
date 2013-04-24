class CreateAcoes < ActiveRecord::Migration
  def change
    create_table :acoes do |t|
      t.string :acao

      t.timestamps
    end
  end
end
