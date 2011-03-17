class Socio < ActiveRecord::Base
  has_many :emprestimos
  has_many :emprestimos_devidos, :class_name => "Emprestimo", :conditions => {:data_devolucao => nil}
  validates_presence_of :nome, :endereco, :telefone
end

