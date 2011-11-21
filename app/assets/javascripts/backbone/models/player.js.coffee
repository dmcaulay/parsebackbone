class Parsebackbone.Models.Player extends Backbone.Model
  paramRoot: 'player'
  idAttribute: 'objectId'

  defaults:
    player_name: null
    score: null
  
class Parsebackbone.Collections.PlayersCollection extends Backbone.Collection
  model: Parsebackbone.Models.Player
  url: '/players'