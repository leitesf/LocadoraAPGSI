class Ator < ActiveRecord::Base
  has_and_belongs_to_many :filmes
  validates_presence_of :nome, :data_nascimento, :nacionalidade

  def self.buscar_por_nome(nome)
    self.find(:first, :conditions => "nome like '%#{nome}%'")
  end
end

