require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/game'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  post '/move' do
    game = Game.new(OpponentDecider.new)
    move = params[:move]
    result, opponent_move = game.play(move.to_sym)
    return erb(:result, locals: {move: move, result: result, opponent_move: opponent_move})
  end
end