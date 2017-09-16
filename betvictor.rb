require_relative 'autoload'
require 'sinatra'
require 'json'
require 'erb'

before do
  # Load and hydrate betting data.
  content = open(Betvictor::Config.filepath).read
  data = JSON.parse(content, symbolize_names: true)
  strategy = Betvictor::Factory::StrategyFactory.create(Betvictor::Config.hydrator)
  @betting = strategy.hydrate(data)

  # Load the repositories
  @sport_repo = Betvictor::Repository::SportRepository.new
  @event_repo = Betvictor::Repository::EventRepository.new
  @outcome_repo = Betvictor::Repository::OutcomeRepository.new
  @betting.sports.each do |sport|
    @sport_repo.save(sport)
    sport.events.each do |event|
      @event_repo.save(event)
      event.outcomes.each {|outcome| @outcome_repo.save(outcome)}
    end
  end
end

get '/' do
  redirect('/sports')
end

get '/sports' do
  @sports = @betting.sports
  @sports.sort_by {|sport| sport.position}
  erb :sports
end

get '/sports/:sport_id/events' do
  @sport = @sport_repo.find(params[:sport_id].to_i) || halt(404)
  @events = @sport ? @sport.events : []
  @events.sort_by {|event| event.position}
  erb :events
end

get '/sports/:sport_id/events/:event_id' do
  @sport = @sport_repo.find(params[:sport_id].to_i) || halt(404)
  @event = @event_repo.find(params[:event_id].to_i) || halt(404)
  @outcomes = @event ? @event.outcomes : []
  @outcomes.sort_by {|outcome| outcome.position}
  erb :outcomes
end

get '/sports/:sport_id/events/:event_id/outcomes/:outcome_id' do
  @sport = @sport_repo.find(params[:sport_id].to_i) || halt(404)
  @event = @event_repo.find(params[:event_id].to_i) || halt(404)
  @outcome = @outcome_repo.find(params[:outcome_id].to_i) || halt(404)
  erb :outcome
end