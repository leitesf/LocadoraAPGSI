class Emprestimo < ActiveRecord::Base
  belongs_to :copia
  belongs_to :socio
  validates_presence_of :data_emprestimo

  def self.buscar_emprestimo_nao_devolvido(copia)
    self.find(:first, :conditions => {:copia_id => copia.id, :data_devolucao => nil})
  end

  def devolver
    self.data_devolucao = Date.today
    self.save
  end
end

