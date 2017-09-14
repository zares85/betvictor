describe Betvictor::Hydrator::PolymorphismStrategy do

  context 'Given a mapping, data and polymorphism info' do

    class ObjectTemp
      attr_accessor :id, :foo
    end

    mapping = {:id => :id}
    data = {:id => 123, :type => 'a', :foo => 'bar'}
    polymorphism = {
        :field => :type,
        :objects => {
            'a' => {
                :object => ObjectTemp,
                :mapping => {
                    :foo => :foo
                }
            }
        }
    }

    it 'Hydrates the object' do
      strategy = Betvictor::Hydrator::PolymorphismStrategy.new(mapping, polymorphism)
      object = strategy.hydrate(data)
      expect(object.class).to eql ObjectTemp
      expect(object.id).to eql 123
      expect(object.foo).to eql 'bar'
    end

  end

end