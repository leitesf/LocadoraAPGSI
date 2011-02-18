class CreateCopias < ActiveRecord::Migration
  def self.up
    create_table :copias do |t|
      t.string :titulo
      t.integer :duracao
      t.string :ano
      t.integer :genero_id
      t.integer :diretor_id
      t.date :aquisicao
      t.string :estado

      t.timestamps
    end
  end

  def self.down
    drop_table :copias
  end
end
