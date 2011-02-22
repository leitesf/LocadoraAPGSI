class CreateFilmes < ActiveRecord::Migration
  def self.up
    create_table :filmes do |t|
      t.string :titulo
      t.integer :duracao
      t.string :ano
      t.integer :genero_id
      t.integer :diretor_id
      t.timestamps
    end
  end

  def self.down
    drop_table :filmes
  end
end
