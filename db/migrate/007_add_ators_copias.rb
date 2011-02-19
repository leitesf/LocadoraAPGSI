class AddAtorsCopias < ActiveRecord::Migration
  def self.up
    create_table :ators_copias do |t|
      t.references :ator, :copia
    end
  end

  def self.down
    drop_table :ators_copias
  end
end

