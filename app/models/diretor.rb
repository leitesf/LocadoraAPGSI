class Diretor < ActiveRecord::Base
  has_many :filmes
  validates_presence_of :data_nascimento, :nome, :nacionalidade

  def self.buscar_por_nome(nome)
    self.find(:first, :conditions => "nome like '%#{nome}%'")
  end
end

