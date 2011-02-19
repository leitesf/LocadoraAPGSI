require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
 
describe Copia do

	fixtures :copias

  it "deveria ser válido" do
    lambda {
			copia = create_ator
		}
  end
	
	it "deveria ser invalido sem titulo" do
		lambda {
			copia = create_copia(:titulo => nil)
			copia.errors.should be_invalid(:titulo)
		}.should_not change(Copia, :count)
	end

	it "deveria ser invalido sem duracao" do
		lambda {
			copia = create_copia(:duracao => nil)
			copia.errors.should be_invalid(:duracao)
		}.should_not change(Copia, :count)
	end

	it "deveria ser invalido sem ano" do
		lambda {
			copia = create_copia(:ano => nil)
			copia.errors.should be_invalid(:ano)
		}.should_not change(Copia, :count)
	end

	it "deveria ser invalido sem data de aquisição" do
		lambda {
			copia = create_copia(:aquisicao => nil)
			copia.errors.should be_invalid(:aquisicao)
		}.should_not change(Copia, :count)
	end

	it "deveria ser invalido sem estado" do
		lambda {
			copia = create_copia(:estado => nil)
			copia.errors.should be_invalid(:estado)
		}.should_not change(Copia, :count)
	end

	it "deveria possuir relacionamento com atores" do
		lambda {
			copia(:nao_foram).ators
		}.should_not raise_error
	end

	it "deveria possuir relacionamento com diretor" do
		lambda {
			copia(:nao_foram).diretor
		}.should_not raise_error
	end

	it "deveria possuir relacionamento com genero" do
		lambda {
			copia(:nao_foram).genero
		}.should_not raise_error
	end

	it "deveria possuir relacionamento com emprestimos" do
		lambda {
			copia(:nao_foram).emprestimos
		}.should_not raise_error
	end

	private
    def create_copia(options={})
      Copia.create({
        :titulo => 'A volta dos que não foram',
				:duracao => 81,
				:ano => '2000',
				:aquisicao => Date.now,
				:estado => 'BOM'
      }.merge(options))
    end
	
end
