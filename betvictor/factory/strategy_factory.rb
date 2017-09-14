module Betvictor
  module Factory

    class StrategyFactory

      def self.create(data)

        if data[:strategy] == Betvictor::Hydrator::BasicStrategy
          strategy = data[:strategy].new(data[:mapping], data[:object])

        elsif data[:strategy] == Betvictor::Hydrator::PolymorphismStrategy
          strategy = data[:strategy].new(data[:mapping], data[:entity], data[:polymorphism])

        else
          raise ArgumentError
        end

        if data[:recursive] == Betvictor::Hydrator::RecursiveStrategy
          strategyBetvictor::Hydrator::RecursiveStrategy.new(strategy, data[:strategies])
        end

        strategy

      end

    end

  end
end