module Betvictor
  module Hydrator

    class OutcomeStrategy < AbstractStrategy

      @market_repo
      @price_repo

      def initialize(market_repo, price_repo)
        @market_repo = self.verify(market_repo, Betvictor::Repository::AbstractRepository)
        @price_repo = self.verify(price_repo, Betvictor::Repository::AbstractRepository)
        super(Betvictor::Entity::Outcome)
      end

      def hydrate(hash, outcome)
        outcome = super(hash, outcome)
        outcome.price = @price_repo.get(outcome.price) if outcome.price
        outcome.market = @price_repo.get(outcome.market) if outcome.market
        outcome
      end

    end

  end
end