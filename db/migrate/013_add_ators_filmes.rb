class AddAtorsFilmes < ActiveRecord::Migration
  def self.up
    create_table :ators_filmes, :id => false do |t|
      t.references :filme, :ator
    end
  end

  def self.down
    drop_table :ators_filmes
  end
end

