Types::GameType = GraphQL::ObjectType.define do
  name "Games"
  description "Stats for a given game."
  interfaces [BasicStatsInterface, SeasonInterface]

  field :player, !types.String, property: :Player
  field :game, !types.String, property: :Game
  field :date, !Types::DateTimeType, property: :Date
  field :vs, !types.String, property: :Vs
  field :map, !types.String, property: :Map
  field :result, !types.String, property: :Result
  field :side, !types.String, property: :Side
  field :mvp, !types.String, property: :MVP
end
