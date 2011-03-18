class SociosController < ApplicationController
  def index
    @socios = Socio.all
  end

  def inadimplentes
    @socios = Socio.socios_devedores
  end

  def show
    @socio = Socio.find(params[:id])
    @ators = Ator.all.collect{|p| [p.nome, p.id]}
  end

  def new
    @socio = Socio.new
    @diretores = Diretor.all.collect{|p| [p.nome, p.id]}
    @generos = Genero.all.collect{|p| [p.descricao, p.id]}
  end

  def new_emprestimo
    @socio = Socio.find(params[:socio_id])
    @copia = Copia.find(params[:emprestimo][:copia_id])
    unless @copia.locado
      @emprestimo = @copia.emprestar(@socio)
      render :update do |p|
        p.insert_html :bottom, 'list_emprestimos_devidos', :partial => 'item_list_emprestimo', :locals => {:emprestimo => @emprestimo}
      end
    else
      render :update do |p|
        p.alert 'Esta cópia está indisponível'
      end
    end
  end

  def edit
    @socio = Socio.find(params[:id])
    @diretores = Diretor.all.collect{|p| [p.nome, p.id]}
    @generos = Genero.all.collect{|p| [p.descricao, p.id]}
  end

  def create
    @socio = Socio.new(params[:socio])
    if @socio.save
        flash[:notice] = 'O socio foi criado com sucesso.'
        redirect_to(@socio)
    else
        render :action => "new"
    end
  end

  def update
    @socio = Socio.find(params[:id])
      if @socio.update_attributes(params[:socio])
        flash[:notice] = 'O socio foi atualizado com sucesso.'
        redirect_to(@socio)
      else
        render :action => "edit"
      end
  end

  def destroy
    @socio = Socio.find(params[:id])
    @socio.destroy
    redirect_to(socios_url)
  end

end