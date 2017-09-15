# Add current directory to load path.
$LOAD_PATH << __dir__

module Betvictor

  autoload :Config, 'config/config'

  module Entity
    autoload :Betting, 'src/entity/betting'
    autoload :AbstractEvent, 'src/entity/event/abstract_event'
    autoload :GameEvent, 'src/entity/event/game_event'
    autoload :RankEvent, 'src/entity/event/rank_event'
    autoload :AbstractStatus, 'src/entity/status/abstract_status'
    autoload :ClockStatus, 'src/entity/status/clock_status'
    autoload :TextStatus, 'src/entity/status/text_status'
    autoload :Market, 'src/entity/market'
    autoload :Meeting, 'src/entity/meeting'
    autoload :Outcome, 'src/entity/outcome'
    autoload :Price, 'src/entity/price'
    autoload :Score, 'src/entity/score'
    autoload :Sport, 'src/entity/sport'
    autoload :Team, 'src/entity/team'
  end

  module Repository
    autoload :AbstractRepository, 'src/repository/abstract_repository'
    autoload :MemoryRepository, 'src/repository/memory_repository'
    autoload :OutcomeRepository, 'src/repository/outcome_repository'
    autoload :EventRepository, 'src/repository/event_repository'
    autoload :SportRepository, 'src/repository/sport_repository'
    autoload :PriceRepository, 'src/repository/price_repository'
    autoload :MarketRepository, 'src/repository/market_repository'
  end

  module Hydrator
    autoload :BasicStrategy, 'src/hydrator/strategy/basic_strategy'
    autoload :RecursiveStrategy, 'src/hydrator/strategy/recursive_strategy'
    autoload :PolymorphismStrategy, 'src/hydrator/strategy/polymorphism_strategy'
  end

  module Factory
    autoload :StrategyFactory, 'src/factory/strategy_factory'
  end

end