class Socio < ActiveRecord::Base
  has_many :emprestimos
  validates_presence_of :nome, :endereco, :telefone
end

