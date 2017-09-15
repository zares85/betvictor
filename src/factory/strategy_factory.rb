module Betvictor
  module Factory

    class StrategyFactory

      def self.create(config)

        if config[:polymorphism]
          strategy = Betvictor::Hydrator::PolymorphismStrategy.new(config[:mapping], config[:polymorphism])
        else
          strategy = Betvictor::Hydrator::BasicStrategy.new(config[:mapping], config[:object])
        end

        if config[:strategies]
          strategy = Betvictor::Hydrator::RecursiveStrategy.new(strategy, config[:strategies])
        end

        strategy

      end

    end

  end
end