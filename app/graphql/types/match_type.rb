Types::MatchType = GraphQL::ObjectType.define do
  name "Matches"
  description "Stats for a given match."
  interfaces [SeasonInterface]

  field :game, !types.String, property: :Game
  field :date, !Types::DateTimeType, property: :Date
  field :vs, !types.String, property: :Vs
  field :map, !types.String, property: :Map
  field :result, !types.String, property: :Result

  # Get both the team objects from the game.
  # TODO: use the data in obj to build some sort of
  # TeamGameType which represents a team over on match.
  
  #field :teams, types[Types::TeamType] do
  #  resolve -> (obj, args, ctx) {

  #  }
  #end

  # Get all the player objects from the game.
  field :players, types[Types::GameType] do
    resolve -> (obj, args, ctx) {
      players = []
      6.times do |i|
        players << obj["Player#{i+1}"]
      end
      players.map {|p| Game.find_by(
        player: p,
        date: obj.Date,
        season: obj.Season,
        game: obj.Game
      )}
    }
  end

end
