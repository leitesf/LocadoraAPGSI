require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Genero do

	fixtures :generos, :filmes

  context 'Deveria validar o model de Genero: ' do

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
      genero = Genero.buscar_por_descricao('Drama')
      for filme in genero.filmes
        filme.genero.descricao.should eql('Drama')
      end
    end
 
  end


	private
    def create_genero(options={})
      Genero.create({
        :descricao => 'Comédia'
      }.merge(options))
    end

end

