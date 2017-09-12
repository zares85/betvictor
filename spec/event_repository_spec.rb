describe Betvictor::Repository::EventRepository do

  repo = Betvictor::Repository::EventRepository.new

  it 'Verifies Game Event entity' do
    entity = Betvictor::Entity::GameEvent.new
    expect(repo.verify(entity)).to eql entity
  end

  it 'Verifies Rank Event entity' do
    entity = Betvictor::Entity::RankEvent.new
    expect(repo.verify(entity)).to eql entity
  end

  it 'Raises with non Event entity' do
    entity = Object.new
    expect {repo.verify(entity)}.to raise_error ArgumentError
  end

end