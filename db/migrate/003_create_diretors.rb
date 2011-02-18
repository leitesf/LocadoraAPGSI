class CreateDiretors < ActiveRecord::Migration
  def self.up
    create_table :diretors do |t|
      t.string :nome
      t.string :nacionalidade
      t.date :data_nascimento

      t.timestamps
    end
  end

  def self.down
    drop_table :diretors
  end
end
