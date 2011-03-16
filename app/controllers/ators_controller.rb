class AtorsController < ApplicationController
  def index
    @ators = Ator.all
  end

  def show
    @ator = Ator.find(params[:id])
  end

  def new
    @ator = Ator.new
  end


  def edit
    @ator = Ator.find(params[:id])
  end

  def create
    @ator = Ator.new(params[:ator])
    if @ator.save
        flash[:notice] = 'O ator foi criado com sucesso.'
        redirect_to(@ator)
    else
        render :action => "new"
    end
  end

  def update
    @ator = Ator.find(params[:id])
      if @ator.update_attributes(params[:ator])
        flash[:notice] = 'O ator foi atualizado com sucesso.'
        redirect_to(@ator)
      else
        render :action => "edit"
      end
  end

  def destroy
    @ator = Ator.find(params[:id])
    @ator.destroy
    redirect_to(ators_url)
  end
  
end