require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Ator do

	fixtures :ators, :filmes

  context 'Deveria validar o model de Ator: ' do

    it "deveria ser válido" do
      lambda {
        ator = create_ator
      }
    end

    it "deveria ser invalido sem nome" do
      lambda {
        ator = create_ator(:nome => nil)
        ator.errors.should be_invalid(:nome)
      }.should_not change(Ator, :count)
    end

    it "deveria ser invalido sem nacionalidade" do
      lambda {
        ator = create_ator(:nacionalidade => nil)
        ator.errors.should be_invalid(:nacionalidade)
      }.should_not change(Ator, :count)
    end

    it "deveria ser invalido sem data_nascimento" do
      lambda {
        ator = create_ator(:data_nascimento => nil)
        ator.errors.should be_invalid(:data_nascimento)
      }.should_not change(Ator, :count)
    end

    it "deveria possuir relacionamento com filmes" do
      lambda {
        ators(:hanks).filmes
      }.should_not raise_error
    end

    it "deveria buscar filmes por ator" do
      ator = Ator.buscar_por_nome('Tom Hanks')
      for filme in ator.filmes
        filme.ator.nome.should eql('Tom Hanks')
      end
    end

  end
  
	private
    def create_ator(options={})
      Ator.create({
        :nome => 'Tom Hanks',
				:nacionalidade => 'EUA',
				:data_nascimento => 13/05/1989
      }.merge(options))
    end

end

