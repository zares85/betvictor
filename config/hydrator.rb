{
    :strategy => Betvictor::Hydrator::RecursiveStrategy,
    :object => Betvictor::Entity::Betting,
    :mapping => {
        :sports => :sports
    },
    :strategies => {
        :sports => {
            :strategy => Betvictor::Hydrator::RecursiveStrategy,
            :repository => Betvictor::Repository::SportRepository,
            :object => Betvictor::Entity::Sport,
            :mapping => {
                :id => :id,
                :title => :title,
                :events => :events
            },
            :strategies => {
                :events => {
                    :strategy => Betvictor::Hydrator::PolymorphismRecursiveStrategy,
                    :repository => Betvictor::Repository::EventRepository,
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
                            :GAMEEVENT => {
                                :object => Betvictor::Entity::GameEvent,
                                :mapping => {
                                    :score => :score,
                                    :home_team => :home_team,
                                    :away_team => :away_team
                                },
                                :strategies => {
                                    :score => {
                                        :strategy => Betvictor::Hydrator::BasicStrategy,
                                        :repository => Betvictor::Repository::ScoreRepository,
                                        :object => Betvictor::Entity::Score,
                                        :mapping => {
                                            :id => :score
                                        }
                                    },
                                    :home_team => {
                                        :strategy => Betvictor::Hydrator::BasicStrategy,
                                        :repository => Betvictor::Repository::TeamRepository,
                                        :object => Betvictor::Entity::Team,
                                        :mapping => {
                                            :id => :home_team
                                        }
                                    },
                                    :away_team => {
                                        :strategy => Betvictor::Hydrator::BasicStrategy,
                                        :repository => Betvictor::Repository::TeamRepository,
                                        :object => Betvictor::Entity::Team,
                                        :mapping => {
                                            :id => :away_team
                                        }
                                    }
                                }
                            },
                            :RANKEVENT => {
                                :object => Betvictor::Entity::RankEvent,
                                :mapping => {
                                    :position => :pos
                                }
                            }
                        }
                    },
                    :strategies => {
                        :meeting => {
                            :strategy => Betvictor::Hydrator::BasicStrategy,
                            :repository => Betvictor::Repository::MeetingRepository,
                            :object => Betvictor::Entity::Meeting,
                            :mapping => {
                                :id => :meeting_id,
                                :name => :meeting
                            }
                        },
                        :status => {
                            :strategy => Betvictor::Hydrator::PolymorphismStrategy,
                            :object => Betvictor::Entity::AbstractStatus,
                            :mapping => {},
                            :polymorphism => {
                                :field => :status_type,
                                :objects => {
                                    :text => {
                                        :object => Betvictor::Entity::RankEvent,
                                        :mapping => {
                                            :position => :pos
                                        }
                                    },
                                    :clock => {
                                        :object => Betvictor::Entity::ClockStatus,
                                        :mapping => {
                                            :duration => :status
                                        }
                                    }
                                }
                            }
                        },
                        :outcomes => {
                            :strategy => Betvictor::Hydrator::RecursiveStrategy,
                            :repository => Betvictor::Repository::OutcomeRepository,
                            :object => Betvictor::Entity::Outcome,
                            :mapping => {
                                :id => :id,
                                :description => :description,
                                :price => :price_id,
                                :market => :market_id
                            },
                            :strategies => {
                                :price => {
                                    :strategy => Betvictor::Hydrator::BasicStrategy,
                                    :object => Betvictor::Entity::Price,
                                    :mapping => {
                                        :id => :price_id,
                                        :name => :price
                                    }
                                },
                                :market => {
                                    :strategy => Betvictor::Hydrator::BasicStrategy,
                                    :repository => Betvictor::Repository::MarketRepository,
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