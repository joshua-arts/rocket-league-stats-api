Types::StageEnum = GraphQL::EnumType.define do
  name "Stage"
  description "Enum for different stages."

  # League play (top 8 teams all play eachother once).
  value("NA_LEAGUE_PLAY", "NA League Play", value: 1)
  value("EU_LEAGUE_PLAY", "EU League Play", value: 2)

  # Playoffs (top 6 teams play for spot at LAN).
  value("NA_PLAYOFFS", "NA Playoffs", value: 3)
  value("EU_PLAYOFFS", "EU Playoffs", value: 4)

  # LAN (in person world championships).
  value("LAN", "LAN Finals", value: 5)
  
  # Overall (complete season results).
  value("NA_OVERALL", "NA Overall", value: 7)
  value("EU_OVERALL", "EU Overall", value: 6)
end
