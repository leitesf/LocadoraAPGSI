require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Copia do

	fixtures :copias, :filmes

  context 'Deveria validar o model de Copia: ' do
    it "deveria ser válido" do
      lambda {
        copia = create_copia
		}
    end
    
    it 'deveria buscar a lista de copias em mal estado' do
      copias = Copia.copias_em_mal_estado
      for copia in copias
        copia.estado.should eql('Ruim')
      end
    end

    
    it "deveria possuir relacionamento com filme" do
      lambda {
        copias(:nao_foram).filme
      }.should_not raise_error
    end
  end

  

	private
    def create_copia(options={})
      Copia.create({
        :filme => filmes[:nao_foram],
				:aquisicao => Date.today,
				:estado => 'BOM'
      }.merge(options))
    end

end

