require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Socio do

	fixtures :socios

  it "deveria ser válido" do
    lambda {
			socio = create_diretor
		}
  end

	it "deveria ser invalido sem nome" do
		lambda {
			socio = create_socio(:nome => nil)
			socio.errors.should be_invalid(:nome)
		}.should_not change(Socio, :count)
	end

	it "deveria ser invalido sem endereco" do
		lambda {
			socio = create_socio(:endereco => nil)
			socio.errors.should be_invalid(:endereco)
		}.should_not change(Socio, :count)
	end

	it "deveria ser invalido sem telefone" do
		lambda {
			socio = create_socio(:telefone => nil)
			socio.errors.should be_invalid(:telefone)
		}.should_not change(Socio, :count)
	end

	it "deveria ter emprestimos" do
		lambda {
			socios(:joao).emprestimos
		}.should_not raise_error
	end

	private
    def create_socio(options={})
      Socio.create({
        :nome => 'João José',
				:endereco => 'Rua das Couves',
				:telefone => '555-5555'
      }.merge(options))
    end

end
