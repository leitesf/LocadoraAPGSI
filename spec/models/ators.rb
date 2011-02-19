require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
 
describe Ator do

	fixtures :ators

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

	it "deveria possuir relacionamento com copias" do
		lambda {
			ator(:hanks).copias
		}.should_not raise_error
	end

	private
    def create_ator(options={})
      Ator.create({
        :nome => 'Tom Hanks',
				:nacionalidade => 'EUA',
				:data_nascimento => Date.now
      }.merge(options))
    end
	
end