class Socio < ActiveRecord::Base
  has_many :emprestimos
  has_many :emprestimos_devidos, :class_name => "Emprestimo", :conditions => {:data_devolucao => nil}
  validates_presence_of :nome, :endereco, :telefone

  def emprestimos_devolvidos
    self.emprestimos - self.emprestimos_devidos
  end

  def self.socios_devedores
    lista = Array.new
    for socio in Socio.all
      if socio.emprestimos_devidos.size > 0
        for emprestimo in socio.emprestimos_devidos
          if (emprestimo.data_emprestimo + 3.days) > Date.today
            lista << socio
          end
        end
      end
    end
    lista
  end
end

