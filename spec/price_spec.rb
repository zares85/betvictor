require_relative '../betvictor/entity/price'

RSpec.describe Betvictor::Entity::Price, '#decimal' do
  context do
    it "Generates the decimal price" do
      price = Betvictor::Entity::Price.new
      price.name = '22/5'
      expect(price.decimal).to eq 22.0 / 5 + 1
    end
  end
end
