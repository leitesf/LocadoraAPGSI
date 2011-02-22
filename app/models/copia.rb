class Copia < ActiveRecord::Base
  belongs_to :filme
  validates_presence_of :aquisicao, :estado

  def self.copias_em_mal_estado
    Copia.find(:all, :conditions => {:estado => 'Ruim'})
  end

end

