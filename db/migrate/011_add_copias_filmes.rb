class AddCopiasFilmes < ActiveRecord::Migration
  def self.up
    drop_table :ators_copias
    create_table :copias_filmes do |t|
      t.references :filme, :copia
    end
  end

  def self.down
    drop_table :copias_filmes
  end
end

