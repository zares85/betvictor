describe Betvictor::Repository::MemoryRepository do

  class ObjectWithId
    attr_accessor :id
  end

  it 'Saves and finds Object by id' do
    repo = Betvictor::Repository::MemoryRepository.new(ObjectWithId)
    entity = ObjectWithId.new
    entity.id = 123
    repo.save(entity)
    expect(repo.find(123)).to eql entity
  end
end