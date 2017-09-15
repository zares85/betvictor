module Betvictor
  module Hydrator

    class RecursiveStrategy < BasicStrategy

      @strategy
      @strategies

      def initialize(strategy, strategies)
        @strategy = strategy
        @strategies = strategies
      end

      def hydrate(hash)
        self.strategies(hash, @strategy.hydrate(hash))
      end

      protected

      def strategies(hash, object)
        @strategies.each do |field, data|
          strategy = Betvictor::Factory::StrategyFactory.create(data)
          value = object.send(field)
          if value.is_a? Array
            value = value.map {|item| strategy.hydrate(item)}
          else
            value = strategy.hydrate(hash)
          end
          object.send("#{field}=", value)
        end
        object
      end

    end

  end
end