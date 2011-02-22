require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Filme do

	fixtures :filmes

  context 'Deveria validar o model de Filme: ' do
    it "deveria ser válido" do
      lambda {
        filme = create_filme
		}
    end
    
    it "deveria ser invalido sem titulo" do
      lambda {
        filme = create_filme(:titulo => nil)
        filme.errors.should be_invalid(:titulo)
      }.should_not change(Filme, :count)
    end

    it "deveria ser invalido sem duracao" do
      lambda {
        filme = create_filme(:duracao => nil)
        filme.errors.should be_invalid(:duracao)
      }.should_not change(Filme, :count)
    end

    it "deveria ser invalido sem ano" do
      lambda {
        filme = create_filme(:ano => nil)
        filme.errors.should be_invalid(:ano)
      }.should_not change(Filme, :count)
    end

    it "deveria possuir relacionamento com atores" do
      lambda {
        filmes(:nao_foram).ators
      }.should_not raise_error
    end

    it "deveria possuir relacionamento com diretor" do
      lambda {
        filmes(:nao_foram).diretor
      }.should_not raise_error
    end

    it "deveria possuir relacionamento com genero" do
      lambda {
        filmes(:nao_foram).genero
      }.should_not raise_error
    end

    it "deveria possuir relacionamento com emprestimos" do
      lambda {
        filmes(:nao_foram).emprestimos
      }.should_not raise_error
    end
  end

	private
    def create_filme(options={})
      Filme.create({
        :titulo => 'A volta dos que não foram',
				:duracao => 81,
				:ano => '2000',
      }.merge(options))
    end

end

