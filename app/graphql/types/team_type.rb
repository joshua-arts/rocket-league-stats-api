Types::TeamType = GraphQL::ObjectType.define do
  name "Teams"
  description "Stats for a given team."
  interfaces [BasicStatsInterface, SeasonInterface]
end
