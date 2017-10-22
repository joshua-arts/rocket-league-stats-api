# Rocket League eSports API

The Rocket League eSports API is an easy to use API that implements a [GraphQL](http://graphql.org/learn/) interface for retrieving data from the parallel.gg database. Currently it supports data from each of the [RLCS](https://www.rlcs.gg/) seasons. I originally built it in order to get more familiar with GraphQL.

You can play around with the API [here](https://rocket-league-esports-api.herokuapp.com/graphiql). If you want to use it in your apps, you can make POST requests to the endpoint at:
https://rocket-league-esports-api.herokuapp.com/graphql

## Using the API

The API has four basic types:
1. Teams - Stats on a team for a given season/stage.
2. Players - Stats on a player for a given season/stage.
3. Matches - Stats on a single game in a best-of-x series.
4. Games - Stats for a single player in a single games of a best-of-x series.

Here are the arguments that you can use when querying each type:

| Types  | Arguments     |
| ------ |:-------------:|
| Team   | season, stage, team |
| Player | season, stage, team, player |
| Match  | season, stage, team, game, map, date, vs, result |
| Game   | season, stage, team, player, game, map, date, vs, result, side |

All arguments can also be used as fields to ask for.
Here are the fields that you can ask for:

| Types  | Field     |
| ------ |:-------------:|
| Team   | all arguments + score, goals, assists, saves, shots |
| Player | all arguments + score, goals, assists, saves, shots |
| Match  | all arguments + players |
| Game   | all arguments + + score, goals, assists, saves, shots |

Stage is the only enum property. The following values are valid for stage:
`NA_LEAGUE_PLAY`, `EU_LEAGUE_PLAY`, `NA_PLAYOFFS`, `EU_PLAYOFFS`, `NA_OVERALL`, `EU_OVERALL`, `LAN`.

## Examples

Try some of these queries [here!](https://rocket-league-esports-api.herokuapp.com/graphiql)

View total score, goals, assits, saves and shots for each time in season 4 NA League Play.
~~~
{
  teams(season: 4, stage: NA_LEAGUE_PLAY){
    team
    score
    goals
    assists
    saves
    shots
  }
}
~~~

View goals scored by NRG eSports at each LAN they've attended.
~~~
{
  teams(team: "NRG eSports", stage: LAN){
    team
    stage
    season
    goals
  }
}
~~~

View total saves and shots for each player on NRG eSports in season 4 NA League Play.
~~~
{
  players(team: "NRG eSports", season: 4, stage: NA_LEAGUE_PLAY){
    player
    saves
    shots
  }
}
~~~

View total goals and shots for Jacob across the various stages in season 4.
~~~
{
  players(player: "Jacob", season: 4){
    stage
    goals
    shots
  }
}
~~~

View matches in season 4 between NRG eSports and Cloud9 and show date, map, game number, result and goals by player.
~~~
{
  matches(team: "NRG eSports", vs: "Cloud9", season: 4){
    date
    map
    game
    result
    players {
      player
      goals
    }
  }
}
~~~

View games Jacob participated in during season 4, and how many goals he got.
~~~
{
  games(player: "Jacob", season: 4){
    date
    map
    game
    vs
    result
    goals
  }
}
~~~

## Contributing

If you'd like to contribute to the API, feel free to reach out or just go ahead and make a pull request!

Special thanks to [Slokh](https://twitter.com/Slokh_) for maintaining the database that this API uses and for allowing me access!
