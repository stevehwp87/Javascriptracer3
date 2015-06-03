get '/' do
  erb :index
end

post '/games' do
  @player1 = Player.find_or_create_by(name: params[:player1])
  @player2 = Player.find_or_create_by(name: params[:player2])
  @game = Game.create
  PlayerGame.create(player: @player1, game: @game, player_number: 1)
  PlayerGame.create(player: @player2, game: @game, player_number: 2)
  erb :game
end

put "/games/:id" do
  @game = Game.find(params[:game_id])
  #update game to be done
  @game.update(done: true)
  # update winner
  # find winner
  @winner = @game.player_games.find_by(player_number: params[:winner_id])
  @winner.winner = true
  @winner.final_index = 19
  @winner.save
  # find loser
  @loser = @game.player_games.where.not(player_number: params[:winner_id]).first
  @loser.winner = false
  @loser.final_index = params[:loser_index]
  @loser.save
end

get "/games/:id" do
  @game = Game.find(params[:id])
  @winner = @game.player_games.find_by(winner: true).player
  @loser = @game.player_games.find_by(winner: false).player
  @player1 = @game.player_games.find_by(player_number: 1)
  @player2 = @game.player_games.find_by(player_number: 2)
  erb :show
end