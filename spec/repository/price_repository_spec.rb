describe Betvictor::Repository::PriceRepository do

  repo = Betvictor::Repository::PriceRepository.new

  it 'Verifies Price entities' do
    entity = Betvictor::Entity::Price.new
    expect(repo.verify(entity)).to eql entity
  end

  it 'Raises with non Price entities' do
    entity = Object.new
    expect {repo.verify(entity)}.to raise_error ArgumentError
  end

end