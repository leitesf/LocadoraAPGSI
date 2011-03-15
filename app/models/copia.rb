class Copia < ActiveRecord::Base
  belongs_to :filme
  has_many :emprestimos
  validates_presence_of :aquisicao, :estado

  def self.copias_em_mal_estado
    Copia.find(:all, :conditions => {:estado => 'Ruim'})
  end


  def emprestar(socio)
    emprestimo = Emprestimo.create(:copia_id => self.id, :socio_id => socio.id, :data_emprestimo => Date.today)
    if emprestimo
      self.locado = true
      self.save
      emprestimo
    end
  end

  def devolver
    if self.locado == true
      Emprestimo.buscar_emprestimo_nao_devolvido(self).devolver
      self.locado = false
      self.save
    else
      false
    end
  end

end

