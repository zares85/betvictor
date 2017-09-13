describe Betvictor::Repository::OutcomeRepository do

  repo = Betvictor::Repository::OutcomeRepository.new

  it 'Verifies Outcome entity' do
    entity = Betvictor::Entity::Outcome.new
    expect(repo.verify(entity)).to eql entity
  end

  it 'Raises with non Outcome entity' do
    entity = Object.new
    expect {repo.verify(entity)}.to raise_error ArgumentError
  end

end