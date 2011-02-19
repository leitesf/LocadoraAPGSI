class Emprestimo < ActiveRecord::Base
  belongs_to :copia
  belongs_to :socio
  validates_presence_of :data_emprestimo
end

