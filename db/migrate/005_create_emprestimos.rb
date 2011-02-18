class CreateEmprestimos < ActiveRecord::Migration
  def self.up
    create_table :emprestimos do |t|
      t.date :data_emprestimo
      t.date :data_devolucao
      t.float :valor
      t.integer :copia_id
      t.integer :socio_id

      t.timestamps
    end
  end

  def self.down
    drop_table :emprestimos
  end
end
