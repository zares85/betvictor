# Add current directory to load path.
$LOAD_PATH << __dir__

module Betvictor

  module Entity
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
  end

end