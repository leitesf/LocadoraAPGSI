class Genero < ActiveRecord::Base
  has_many :copias
  validates_presence_of :descricao
end

