BasicStatsInterface = GraphQL::InterfaceType.define do
  name "BasicStats"
  description "Interface for including end of match statistics."

  field :score, !types.Int, property: :Score
  field :goals, !types.Int, property: :Goals
  field :assists, !types.Int, property: :Assists
  field :saves, !types.Int, property: :Saves
  field :shots, !types.Int, property: :Shots
end
