module Betvictor
  class Config

    def self.sourceurl
      'https://www.betvictor.com/live/en/live/list.json'
    end

    def self.filepath
      __dir__ + '/../data/list.json'
    end

    def self.hydrator
      {
          :object => Betvictor::Entity::Betting,
          :mapping => {
              :sports => :sports
          },
          :strategies => {
              :sports => {
                  :object => Betvictor::Entity::Sport,
                  :mapping => {
                      :id => :id,
                      :title => :title,
                      :virtual => :is_virtual,
                      :events => :events,
                      :position => :pos
                  },
                  :strategies => {
                      :events => {
                          :object => Betvictor::Entity::AbstractEvent,
                          :mapping => {
                              :id => :id,
                              :virtual => :is_virtual,
                              :outcomes => :outcomes,
                              :title => :title,
                              :meeting => :meeting_id,
                              :status => :status,
                              :position => :pos
                          },
                          :polymorphism => {
                              :field => :event_type,
                              :objects => {
                                  'GAMEEVENT' => {
                                      :object => Betvictor::Entity::GameEvent,
                                      :mapping => {
                                          :score => :score,
                                          :home_team => :home_team,
                                          :away_team => :away_team
                                      },
                                      :strategies => {
                                          :score => {
                                              :object => Betvictor::Entity::Score,
                                              :mapping => {
                                                  :id => :score
                                              }
                                          },
                                          :home_team => {
                                              :object => Betvictor::Entity::Team,
                                              :mapping => {
                                                  :id => :home_team
                                              }
                                          },
                                          :away_team => {
                                              :object => Betvictor::Entity::Team,
                                              :mapping => {
                                                  :id => :away_team
                                              }
                                          }
                                      }
                                  },
                                  'RANKEVENT' => {
                                      :object => Betvictor::Entity::RankEvent,
                                      :mapping => {
                                          :position => :pos
                                      }
                                  }
                              }
                          },
                          :strategies => {
                              :meeting => {
                                  :object => Betvictor::Entity::Meeting,
                                  :mapping => {
                                      :id => :meeting_id,
                                      :name => :meeting
                                  }
                              },
                              :status => {
                                  :object => Betvictor::Entity::AbstractStatus,
                                  :mapping => {},
                                  :polymorphism => {
                                      :field => :status_type,
                                      :objects => {
                                          'text' => {
                                              :object => Betvictor::Entity::RankEvent,
                                              :mapping => {
                                                  :position => :pos
                                              }
                                          },
                                          'clock' => {
                                              :object => Betvictor::Entity::ClockStatus,
                                              :mapping => {
                                                  :duration => :status
                                              }
                                          }
                                      }
                                  }
                              },
                              :outcomes => {
                                  :object => Betvictor::Entity::Outcome,
                                  :mapping => {
                                      :id => :id,
                                      :description => :description,
                                      :price => :price_id,
                                      :market => :market_id,
                                      :position => :print_order
                                  },
                                  :strategies => {
                                      :price => {
                                          :object => Betvictor::Entity::Price,
                                          :mapping => {
                                              :id => :price_id,
                                              :name => :price
                                          }
                                      },
                                      :market => {
                                          :object => Betvictor::Entity::Market,
                                          :mapping => {
                                              :id => :market_id,
                                              :name => :market
                                          }
                                      }
                                  }
                              }
                          }
                      }
                  }
              }
          }
      }
    end

  end
end