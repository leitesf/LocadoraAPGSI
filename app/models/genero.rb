class Genero < ActiveRecord::Base
  has_many :filmes
  validates_presence_of :descricao
end

