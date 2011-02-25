class Genero < ActiveRecord::Base
  has_many :filmes
  validates_presence_of :descricao

  def self.buscar_por_descricao(descricao)
    self.find(:first, :conditions => "descricao like '%#{descricao}%'")
  end
end

