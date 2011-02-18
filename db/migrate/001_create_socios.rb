class CreateSocios < ActiveRecord::Migration
  def self.up
    create_table :socios do |t|
      t.string :nome
      t.string :endereco
      t.string :telefone

      t.timestamps
    end
  end

  def self.down
    drop_table :socios
  end
end
