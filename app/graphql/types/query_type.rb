# Filter records to only include those with API readable stages.
def stage_filter(records)
  valid_stages = Types::StageEnum.values.values.map{ |e| e.value }
  records.select{ |r| valid_stages.include?(r.Stage) }
end

# Adds arguments that all root level fields contain.
def build_field(&block)
  GraphQL::Field.define do
    argument :season, types.Int
    argument :stage, Types::StageEnum
    argument :team, types.String

    instance_exec(&block)
  end
end

Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema."

  # Root level fields (entry points).

  players = build_field do
    type types[Types::PlayerType]
    argument :player, types.String
    resolve -> (obj, args, ctx) {
      stage_filter(Player.where(args.to_h))
    }
  end
  field :players, field: players

  teams = build_field do
    type types[Types::TeamType]
    resolve -> (obj, args, ctx) {
      stage_filter(Team.where(args.to_h))
    }
  end
  field :teams, field: teams

  matches = build_field do
    type types[Types::MatchType]
    argument :game, types.Int
    argument :map, types.String
    argument :date, Types::DateTimeType
    argument :vs, types.String
    argument :result, types.String
    resolve -> (obj, args, ctx) {
      stage_filter(Match.where(args.to_h))
    }
  end
  field :matches, field: matches

  games = build_field do
    type types[Types::GameType]
    argument :player, types.String
    argument :game, types.Int
    argument :map, types.String
    argument :side, types.String
    argument :date, Types::DateTimeType
    argument :vs, types.String
    argument :result, types.String
    resolve -> (obj, args, ctx) {
      stage_filter(Game.where(args.to_h))
    }
  end
  field :games, field: games

end
