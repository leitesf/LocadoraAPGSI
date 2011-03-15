require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Copia do

	fixtures :copias, :filmes, :socios

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

    it "deveria emprestar a cópia do filme" do
      lambda{
        emprestimo = copias(:nao_foram).emprestar(socios(:joao))
        emprestimo.should be_an_instance_of(Emprestimo)
        copias(:nao_foram).locado.should be_true
        socios(:joao).emprestimos.should include(emprestimo)
      }
      
    end

    it "deveria devolver o filme que foi alugado" do
      copia = copias(:nao_foram)
      lambda{
        emprestimo = copia.emprestar(socios(:joao))
        copia.devolver.should be_true
        copia.locado.should be_false
        emprestimo.data_devolucao.should eql(Date.today)
      }
    end

    it "não deveria devolver um filme que não está alugado" do
      copias(:nao_foram).devolver.should eql false
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

