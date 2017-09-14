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
        self.strategies(@strategy.hydrate(hash))
      end

      protected

      def strategies(object)
        @strategies.each do |field, data|
          objects = []
          object.send(field).each do |item|
            strategy = Betvictor::Factory::StrategyFactory.create(data)
            objects << strategy.hydrate(item)
          end
          object.send("#{field}=", objects)
        end
        object
      end

    end

  end
end