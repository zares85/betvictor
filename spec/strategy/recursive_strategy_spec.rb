describe Betvictor::Hydrator::RecursiveStrategy do

  context 'Given a mapping, data and strategies' do

    class RecursiveObjectTemp
      attr_accessor :foo, :bar, :baz
    end

    class ObjectTemp
      attr_accessor :id, :name
    end

    mapping = {:foo => :abc, :bar => :xyz}

    data = {
        :abc => 'baz',
        :xyz => [
            {:id => 123, :name => 'aaa'},
            {:id => 456, :name => 'bbb'}
        ],
        :single_id => 789,
        :single_name => 'ccc'
    }

    strategies = {
        :bar => {
            :strategy => Betvictor::Hydrator::BasicStrategy,
            :object => ObjectTemp,
            :mapping => {:id => :id, :name => :name}
        },
        :baz => {
            :strategy => Betvictor::Hydrator::BasicStrategy,
            :object => ObjectTemp,
            :mapping => {:id => :single_id, :name => :single_name}
        }
    }

    it 'Hydrates the object and apply recursive strategy' do
      strategy = Betvictor::Hydrator::BasicStrategy.new(mapping, RecursiveObjectTemp)
      strategy = Betvictor::Hydrator::RecursiveStrategy.new(strategy, strategies)
      object = strategy.hydrate(data)

      expect(object.class).to eql RecursiveObjectTemp
      expect(object.foo).to eql 'baz'

      expect(object.bar.size).to eql 2
      expect(object.bar[0].class).to eql ObjectTemp
      expect(object.bar[0].id).to eql 123
      expect(object.bar[0].name).to eql 'aaa'
      expect(object.bar[1].class).to eql ObjectTemp
      expect(object.bar[1].id).to eql 456
      expect(object.bar[1].name).to eql 'bbb'

      expect(object.baz.class).to eql ObjectTemp
      expect(object.baz.id).to eql 789
      expect(object.baz.name).to eql 'ccc'
    end

  end

end