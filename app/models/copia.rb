class Copia < ActiveRecord::Base
  belongs_to :diretor
  belongs_to :generos
  has_many :emprestimos
  has_and_belongs_to_many :ators
end
