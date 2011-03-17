require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Emprestimo do

	fixtures :emprestimos, :socios, :copias

  it "deveria ser válido" do
    lambda {
			emprestimo = create_ator
		}
  end

	it "deveria ser invalido sem data de empréstimo" do
		lambda {
			emprestimo = create_emprestimo(:data_emprestimo => nil)
			emprestimo.errors.should be_invalid(:data_emprestimo)
		}.should_not change(Emprestimo, :count)
	end

	it "deveria possuir relacionamento com cópia" do
		lambda {
			emprestimos(:nao_foram).copia
		}.should_not raise_error
	end

	it "deveria possuir relacionamento com sócio" do
		lambda {
			emprestimos(:nao_foram).socio
		}.should_not raise_error
	end

	private
    def create_emprestimo(options={})
      Emprestimo.create({
        :data_emprestimo => Date.today,
      }.merge(options))
    end

end

