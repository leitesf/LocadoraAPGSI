require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Diretor do

	fixtures :diretors

  context 'Deveria validar o model de Ator: ' do

    it "deveria ser válido" do
      lambda {
        diretor = create_diretor
      }
    end

    it "deveria ser invalido sem nome" do
      lambda {
        diretor = create_diretor(:nome => nil)
        diretor.errors.should be_invalid(:nome)
      }.should_not change(Diretor, :count)
    end

    it "deveria ser invalido sem nacionalidade" do
      lambda {
        diretor = create_diretor(:nacionalidade => nil)
        diretor.errors.should be_invalid(:nacionalidade)
      }.should_not change(Diretor, :count)
    end

    it "deveria ser invalido sem data_nascimento" do
      lambda {
        diretor = create_diretor(:data_nascimento => nil)
        diretor.errors.should be_invalid(:data_nascimento)
      }.should_not change(Diretor, :count)
    end

    it "deveria possuir relacionamento com filmes" do
      lambda {
        diretors(:spielberg).filmes
      }.should_not raise_error
    end

    it "deveria buscar filmes por diretor" do
      diretor = Diretor.buscar_por_nome('Tom Hanks')
      for filme in diretor.filmes
        filme.diretor.should eql(diretor)
      end
    end

  end

	private
    def create_diretor(options={})
      Diretor.create({
        :nome => 'Steven Spielberg',
				:nacionalidade => 'EUA',
				:data_nascimento => Date.today
      }.merge(options))
    end

end

