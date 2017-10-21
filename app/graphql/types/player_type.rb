Types::PlayerType = GraphQL::ObjectType.define do
  name "Players"
  description "Stats for a given player."
  interfaces [BasicStatsInterface, SeasonInterface]

  field :player, !types.String, property: :Player
end
