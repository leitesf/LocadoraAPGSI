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

  def valor_devido
    unless self.data_devolucao == nil
      dias = (self.data_devolucao - self.data_emprestimo).to_i
      if dias> 3
        self.valor + (self.valor * (dias - 3))
      else
        self.valor
      end
    else
      0.to_f
    end    
  end
end

