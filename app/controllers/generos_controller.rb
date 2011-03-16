class GenerosController < ApplicationController
  def index
    @generos = Genero.all
  end

  def show
    @genero = Genero.find(params[:id])
  end

  def new
    @genero = Genero.new
  end


  def edit
    @genero = Genero.find(params[:id])
  end

  def create
    @genero = Genero.new(params[:genero])
    if @genero.save
        flash[:notice] = 'O genero foi criado com sucesso.'
        redirect_to(@genero)
    else
        render :action => "new"
    end
  end

  def update
    @genero = Genero.find(params[:id])
      if @genero.update_attributes(params[:genero])
        flash[:notice] = 'O genero foi atualizado com sucesso.'
        redirect_to(@genero)
      else
        render :action => "edit"
      end
  end

  def destroy
    @genero = Genero.find(params[:id])
    @genero.destroy
    redirect_to(generos_url)
  end
  
end