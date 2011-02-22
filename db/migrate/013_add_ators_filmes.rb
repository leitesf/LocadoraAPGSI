class AddAtorsFilmes < ActiveRecord::Migration
  def self.up
    drop_table :copias_filmes
    create_table :ators_filmes do |t|
      t.references :filme, :ator
    end
  end

  def self.down
    drop_table :ators_filmes
  end
end

