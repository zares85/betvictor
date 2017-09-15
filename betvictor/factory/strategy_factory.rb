module Betvictor
  module Factory

    class StrategyFactory

      def self.create(data)

        if data[:polymorphism]
          strategy = Betvictor::Hydrator::PolymorphismStrategy.new(data[:mapping], data[:polymorphism])
        else
          strategy = Betvictor::Hydrator::BasicStrategy.new(data[:mapping], data[:object])
        end

        if data[:strategies]
          strategy = Betvictor::Hydrator::RecursiveStrategy.new(strategy, data[:strategies])
        end

        strategy

      end

    end

  end
end