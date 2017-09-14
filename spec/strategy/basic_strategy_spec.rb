describe Betvictor::Hydrator::BasicStrategy do

  context 'Given a mapping and data' do

    mapping = {:foo => :abc, :bar => :xyz}
    data = {:abc => 'baz', :xyz => 123}

    class ObjectTemp
      attr_accessor :foo, :bar
    end

    it 'Hydrates the object' do
      strategy = Betvictor::Hydrator::BasicStrategy.new(mapping, ObjectTemp)
      object = strategy.hydrate(data)
      expect(object.class).to eql ObjectTemp
      expect(object.foo).to eql 'baz'
      expect(object.bar).to eql 123
    end

  end

end