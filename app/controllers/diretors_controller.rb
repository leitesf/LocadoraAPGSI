class DiretorsController < ApplicationController
  def index
    @diretors = Diretor.all
  end

  def show
    @diretor = Diretor.find(params[:id])
  end

  def new
    @diretor = Diretor.new
  end


  def edit
    @diretor = Diretor.find(params[:id])
  end

  def create
    @diretor = Diretor.new(params[:diretor])
    if @diretor.save
        flash[:notice] = 'O diretor foi criado com sucesso.'
        redirect_to(@diretor)
    else
        render :action => "new"
    end
  end

  def update
    @diretor = Diretor.find(params[:id])
      if @diretor.update_attributes(params[:diretor])
        flash[:notice] = 'O diretor foi atualizado com sucesso.'
        redirect_to(@diretor)
      else
        render :action => "edit"
      end
  end

  def destroy
    @diretor = Diretor.find(params[:id])
    @diretor.destroy
    redirect_to(diretors_url)
  end
  
end