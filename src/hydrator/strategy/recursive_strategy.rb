module Betvictor
  module Hydrator

    class RecursiveStrategy < BasicStrategy

      @strategy
      @strategies

      def initialize(strategy, strategies)
        @strategy = self.verify(strategy, BasicStrategy)
        @strategies = self.verify(strategies, Hash)
      end

      def hydrate(data)
        self.strategies(data, @strategy.hydrate(data))
      end

      protected

      def strategies(data, object)
        @strategies.each do |field, config|
          strategy = Betvictor::Factory::StrategyFactory.create(config)
          value = object.send(field)
          if value.is_a? Array
            value = value.map {|item| strategy.hydrate(item)}
          else
            value = strategy.hydrate(data)
          end
          object.send("#{field}=", value)
        end
        object
      end

    end

  end
end