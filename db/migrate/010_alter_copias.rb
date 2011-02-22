class AlterCopias < ActiveRecord::Migration
  def self.up
    remove_column :copias, :titulo
    remove_column :copias, :duracao
    remove_column :copias, :ano
    remove_column :copias, :genero_id
    remove_column :copias, :diretor_id
  end

  def self.down
    add_column :copias, :titulo, :string
    add_column :copias, :duracao, :integer
    add_column :copias, :ano, :string
    add_column :copias, :genero_id, :integer
    add_column :copias, :diretor_id, :integer
  end
end
