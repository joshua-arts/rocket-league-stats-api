SeasonInterface = GraphQL::InterfaceType.define do
  name "Season"
  description "Interface for including season seperators."

  field :season, !types.Int, property: :Season
  field :stage, !Types::StageEnum, property: :Stage
  field :team, !types.String, property: :Team
end
