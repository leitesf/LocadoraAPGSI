class Ator < ActiveRecord::Base
  has_and_belongs_to_many :copias
  validates_presence_of :nome, :data_nascimento, :nacionalidade
end

