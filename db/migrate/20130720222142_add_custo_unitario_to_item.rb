class AddCustoUnitarioToItem < ActiveRecord::Migration
  def change
    add_column :itens, :custo_unitario, :float
  end
end
