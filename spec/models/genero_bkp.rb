require 'spec_helper'

describe Genero do
  before(:each) do
    @valid_attributes = {
      :descricao => "value for descricao"
    }
  end

  it "should create a new instance given valid attributes" do
    Genero.create!(@valid_attributes)
  end
end
