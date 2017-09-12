describe Betvictor::Repository::SportRepository do

  repo = Betvictor::Repository::SportRepository.new

  it 'Verifies Sport entities' do
    entity = Betvictor::Entity::Sport.new
    expect(repo.verify(entity)).to eql entity
  end

  it 'Raises with non Sport entities' do
    entity = Object.new
    expect {repo.verify(entity)}.to raise_error ArgumentError
  end

end