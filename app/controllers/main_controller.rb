class MainController < ApplicationController
  def index
  end

  def devolucao
    @copia = Copia.find(params[:devolucao][:copia_id])
    if @copia
      if @copia.locado
        @copia.devolver
        render :update do |p|
          p.alert "Cópia devolvida com sucesso. Valor => #{@copia.valor_devido_do_ultimo_emprestimo}"
        end
      else
        render :update do |p|
          p.alert 'Esta cópia não está locada'
        end
      end
    else
      p.alert 'Cópia não encontrada'
    end
  end
end
