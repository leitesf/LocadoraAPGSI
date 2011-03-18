require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Copia do

	fixtures :copias, :filmes, :socios, :emprestimos

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

    it "deveria ter uma lista de copias em mal estado" do
      copias = Copia.copias_em_mal_estado.should be_an_instance_of(Array)
    end

    
    it "deveria possuir relacionamento com filme" do
      lambda {
        copias(:nao_foram).filme
      }.should_not raise_error
    end

    it "deveria emprestar a cópia do filme" do
      lambda{
        emprestimo = copias(:nao_foram).emprestar(socios(:joao))
        socios(:joao).emprestimos.should include(emprestimo)
      }      
    end

    it "deveria trazer uma instancia de emprestimo" do
      copias(:nao_foram).emprestar(socios(:joao)).should be_an_instance_of(Emprestimo)
    end

    it "o filme deveria estar locado depois de emprestado" do
      emprestimo = copias(:nao_foram).emprestar(socios(:joao))
      copias(:nao_foram).locado.should be_true
    end

    it "deveria devolver o filme que foi alugado" do
      copia = copias(:nao_foram)
      lambda{
        emprestimo = copia.emprestar(socios(:joao))
        copia.devolver.should be_true
      }
    end

    it "deveria estar com locado false depois de devolver o filme" do
      copia = copias(:nao_foram)
      lambda{
        emprestimo = copia.emprestar(socios(:joao))
        copia.devolver
        copia.locado.should be_false
      }
    end

    it "deveria trazer a data devolução como hoje ao devolver um filme" do
      copia = copias(:nao_foram)
      lambda{
        emprestimo = copia.emprestar(socios(:joao))
        copia.devolver
        emprestimo.data_devolucao.should eql(Date.today)
      }
    end

    it "não deveria devolver um filme que não está alugado" do
      copias(:nao_foram).devolver.should eql false
    end

    it "deveria retornar o valor devido do último empréstimo" do
      copias(:nao_foram).valor_devido_do_ultimo_emprestimo.should eql(9.0)
    end

    it "deveria trazer valor zero para um empréstimo não devolvido" do
      copias(:de_volta).valor_devido_do_ultimo_emprestimo.should eql(0.0)
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

