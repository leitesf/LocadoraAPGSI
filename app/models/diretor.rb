class Diretor < ActiveRecord::Base
  has_many :copias
  validates_presence_of :data_nascimento, :nome, :nacionalidade
end

