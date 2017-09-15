# Add current directory to load path.
$LOAD_PATH << __dir__

module Betvictor

  autoload :Config, 'config/config'

  module Entity
    autoload :Betting, 'betvictor/entity/betting'
    autoload :AbstractEvent, 'betvictor/entity/event/abstract_event'
    autoload :GameEvent, 'betvictor/entity/event/game_event'
    autoload :RankEvent, 'betvictor/entity/event/rank_event'
    autoload :AbstractStatus, 'betvictor/entity/status/abstract_status'
    autoload :ClockStatus, 'betvictor/entity/status/clock_status'
    autoload :TextStatus, 'betvictor/entity/status/text_status'
    autoload :Market, 'betvictor/entity/market'
    autoload :Meeting, 'betvictor/entity/meeting'
    autoload :Outcome, 'betvictor/entity/outcome'
    autoload :Price, 'betvictor/entity/price'
    autoload :Score, 'betvictor/entity/score'
    autoload :Sport, 'betvictor/entity/sport'
    autoload :Team, 'betvictor/entity/team'
  end

  module Repository
    autoload :AbstractRepository, 'betvictor/repository/abstract_repository'
    autoload :MemoryRepository, 'betvictor/repository/memory_repository'
    autoload :OutcomeRepository, 'betvictor/repository/outcome_repository'
    autoload :EventRepository, 'betvictor/repository/event_repository'
    autoload :SportRepository, 'betvictor/repository/sport_repository'
    autoload :PriceRepository, 'betvictor/repository/price_repository'
    autoload :MarketRepository, 'betvictor/repository/market_repository'
  end

  module Hydrator
    autoload :BasicStrategy, 'betvictor/hydrator/strategy/basic_strategy'
    autoload :RecursiveStrategy, 'betvictor/hydrator/strategy/recursive_strategy'
    autoload :PolymorphismStrategy, 'betvictor/hydrator/strategy/polymorphism_strategy'
  end

  module Factory
    autoload :StrategyFactory, 'betvictor/factory/strategy_factory'
  end

end