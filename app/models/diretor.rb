class Diretor < ActiveRecord::Base
  has_many :filmes
  validates_presence_of :data_nascimento, :nome, :nacionalidade
end

