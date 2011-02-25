require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Genero do

	fixtures :generos, :filmes

  it "deveria ser válido" do
    lambda {
			genero = create_genero
		}
  end

	it "deveria ser invalido sem descricao" do
		lambda {
			genero = create_genero(:descricao => nil)
			genero.errors.should be_invalid(:descricao)
		}.should_not change(Genero, :count)
	end

	it "deveria possuir relacionamento com filmes" do
		lambda {
			generos(:drama).filmes
		}.should_not raise_error
	end

  it "deveria buscar o filme pelo genero" do
    genero = Genero.buscar_por_descricao('drama')
    filmes = genero.filmes
    for filme in filmes
      filme.genero.descricao.should include('drama')
    end
  end

	private
    def create_genero(options={})
      Genero.create({
        :descricao => 'Comédia'
      }.merge(options))
    end

end

