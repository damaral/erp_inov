class AddRolesMaskToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :roles_mask, :integer
  end
end
