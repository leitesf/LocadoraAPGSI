class AddColumnLocadoCopias < ActiveRecord::Migration
  def self.up
    add_column :copias, :locado, :boolean, :default => false
  end

  def self.down
    remove_column :copias, :locado
  end
end

