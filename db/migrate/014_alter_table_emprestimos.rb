class AlterTableEmprestimos < ActiveRecord::Migration
  def self.up
    change_column :emprestimos, :valor, :float, :default => 3
  end

  def self.down
    change_column :emprestimos, :valor, :float
  end
end
