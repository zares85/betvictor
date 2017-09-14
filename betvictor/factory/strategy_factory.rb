module Betvictor
  module Factory

    class StrategyFactory

      def self.create(data)

        if data[:strategy] == Betvictor::Hydrator::BasicStrategy
          return data[:strategy].new(data[:mapping], data[:object])

        elsif data[:strategy] == Betvictor::Hydrator::RecursiveStrategy
          return data[:strategy].new(data[:mapping], data[:object], data[:strategies])

        elsif data[:strategy] == Betvictor::Hydrator::PolymorphismStrategy
          return data[:strategy].new(data[:mapping], data[:entity], data[:polymorphism])

        else
          raise ArgumentError
        end

      end

    end

  end
end