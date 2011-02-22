class Copia < ActiveRecord::Base
  belongs_to :diretor
  belongs_to :genero
  has_many :emprestimos
  has_and_belongs_to_many :ators
  validates_presence_of :titulo, :duracao, :ano, :aquisicao, :estado

  def self.copias_em_mal_estado
    Copia.find(:all, :conditions => {:estado => 'Ruim'})
  end

end

