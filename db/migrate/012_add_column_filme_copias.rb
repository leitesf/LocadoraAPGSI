class AddColumnFilmeCopias < ActiveRecord::Migration
  def self.up
    add_column :copias, :filme_id, :integer
  end

  def self.down
    remove_column :copias, :filme_id
  end
end

