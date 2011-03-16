class FilmesController < ApplicationController
  def index
    @filmes = Filme.all
  end

  def show
    @filme = Filme.find(params[:id])
  end

  def new
    @filme = Filme.new
    @diretores = Diretor.all.collect{|p| [p.id, p.nome]}
    @generos = Genero.all.collect{|p| [p.id, p.descricao]}
  end


  def edit
    @filme = Filme.find(params[:id])
    @diretores = Diretor.all.collect{|p| [p.nome, p.id]}
    @generos = Genero.all.collect{|p| [p.descricao, p.id]}
  end

  def create
    @filme = Filme.new(params[:filme])
    if @filme.save
        flash[:notice] = 'O filme foi criado com sucesso.'
        redirect_to(@filme)
    else
        render :action => "new"
    end
  end

  def update
    @filme = Filme.find(params[:id])
      if @filme.update_attributes(params[:filme])
        flash[:notice] = 'O filme foi atualizado com sucesso.'
        redirect_to(@filme)
      else
        render :action => "edit"
      end
  end

  def destroy
    @filme = Filme.find(params[:id])
    @filme.destroy
    redirect_to(filmes_url)
  end
  
end