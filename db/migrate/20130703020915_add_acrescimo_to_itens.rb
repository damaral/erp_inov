class AddAcrescimoToItens < ActiveRecord::Migration
  def change
    add_column :itens, :acrescimo, :float, :default => 0
  end
end
