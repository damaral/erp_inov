class AddDataRealizadaToFatura < ActiveRecord::Migration
  def change
    add_column :faturas, :data_realizada, :date
  end
end
