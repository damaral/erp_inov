class AddDataRealizadaToPagamento < ActiveRecord::Migration
  def change
    add_column :pagamentos, :data_realizada, :date
  end
end
