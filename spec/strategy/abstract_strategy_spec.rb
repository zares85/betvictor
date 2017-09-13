describe Betvictor::Hydrator::AbstractStrategy do

  context 'Given a mapping and data' do

    mapping = {:foo => :abc, :bar => :xyz}
    data = {:abc => 'baz', :xyz => 123}

    class ObjectTemp
      attr_accessor :foo, :bar
    end

    it 'Hydrates the object' do
      object = ObjectTemp.new
      strategy = Betvictor::Hydrator::AbstractStrategy.new(mapping, object.class)
      strategy.hydrate(data, object)
      expect(object.foo).to eql 'baz'
      expect(object.bar).to eql 123
    end

  end

end