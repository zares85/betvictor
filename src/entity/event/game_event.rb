module Betvictor
  module Entity

    class GameEvent < AbstractEvent

      attr_accessor :score, :home_team, :away_team

    end

  end
end