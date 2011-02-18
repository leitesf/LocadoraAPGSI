class Emprestimo < ActiveRecord::Base
  belongs_to :copia
  belongs_to :socio
end
