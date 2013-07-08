class AddDefaultValueToEstado < ActiveRecord::Migration
  def change
    change_column :oss, :estado, :integer, :default => 0
  end
end
