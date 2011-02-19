require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
 
describe Diretor do

	fixtures :diretors

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

	it "deveria possuir relacionamento com copias" do
		lambda {
			diretor(:spielberg).copias
		}.should_not raise_error
	end

	private
    def create_diretor(options={})
      Diretor.create({
        :nome => 'Steven Spielberg',
				:nacionalidade => 'EUA',
				:data_nascimento => Date.now
      }.merge(options))
    end
	
end
