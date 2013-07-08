class AddDefaultValueToDesconto < ActiveRecord::Migration
  def change
    change_column :itens, :desconto, :float, :default => 0
  end
end
