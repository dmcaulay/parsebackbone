class Parsebackbone.Models.GameScore extends Backbone.Model
  paramRoot: 'game_score'
  idAttribute: 'objectId'

  defaults:
    team: null
    score: null
  
class Parsebackbone.Collections.GameScoresCollection extends Backbone.Collection
  model: Parsebackbone.Models.GameScore
  url: '/game_scores'