class CreateAtors < ActiveRecord::Migration
  def self.up
    create_table :ators do |t|
      t.string :nome
      t.string :nacionalidade
      t.date :data_nascimento

      t.timestamps
    end
  end

  def self.down
    drop_table :ators
  end
end
