class Filme < ActiveRecord::Base
  belongs_to :diretor
  belongs_to :genero
  has_many :copias
  has_many :copias_livres, :class_name => "Copia", :conditions => {:locado => 'false'}
  has_and_belongs_to_many :ators
  validates_presence_of :titulo, :duracao, :ano
end

