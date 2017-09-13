describe Betvictor::Repository::MarketRepository do

  repo = Betvictor::Repository::MarketRepository.new

  it 'Verifies Market entities' do
    entity = Betvictor::Entity::Market.new
    expect(repo.verify(entity)).to eql entity
  end

  it 'Raises with non Market entities' do
    entity = Object.new
    expect {repo.verify(entity)}.to raise_error ArgumentError
  end

end