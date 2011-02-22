class Filme < ActiveRecord::Base
  belongs_to :diretor
  belongs_to :genero
  has_many :emprestimos
  has_and_belongs_to_many :ators
  validates_presence_of :titulo, :duracao, :ano
end

