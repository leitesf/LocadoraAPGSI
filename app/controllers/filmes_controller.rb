class FilmesController < ApplicationController
  def index
    @filmes = Filme.all
  end

  def show
    @filme = Filme.find(params[:id])
    @ators = Ator.all.collect{|p| [p.nome, p.id]}
  end

  def new
    @filme = Filme.new
    @diretores = Diretor.all.collect{|p| [p.nome, p.id]}
    @generos = Genero.all.collect{|p| [p.descricao, p.id]}
  end

  def new_ator
    @ator = Ator.find(params[:ator][:ator_id])
    @filme = Filme.find(params[:filme_id])
    unless @filme.ators.include? @ator
      @filme.ators << @ator
      render :update do |p|
        p.insert_html :bottom, 'list_atores', :partial => 'ators/list', :locals => {:ator => @ator}
      end
    else
      render :update do |p|
        p.alert 'Esse ator já está incluído no filme'
      end
    end
  end

  def new_copia
    @copia = Copia.new(params[:copia])
    @copia.filme_id = params[:filme_id]
    @copia.save
    render :update do |p|
      p.insert_html :bottom, 'list_copias', :partial => 'list_copias', :locals => {:copia => @copia}
    end
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