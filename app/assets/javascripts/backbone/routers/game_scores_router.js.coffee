class Parsebackbone.Routers.GameScoresRouter extends Backbone.Router
  initialize: (options) ->
    @gameScores = new Parsebackbone.Collections.GameScoresCollection()
    @gameScores.reset options.gameScores

  routes:
    "/new"      : "newGameScore"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newGameScore: ->
    @view = new Parsebackbone.Views.GameScores.NewView(collection: @gameScores)
    $("#game_scores").html(@view.render().el)

  index: ->
    @view = new Parsebackbone.Views.GameScores.IndexView(gameScores: @gameScores)
    $("#game_scores").html(@view.render().el)

  show: (id) ->
    game_score = @gameScores.get(id)
    
    @view = new Parsebackbone.Views.GameScores.ShowView(model: game_score)
    $("#game_scores").html(@view.render().el)
    
  edit: (id) ->
    game_score = @gameScores.get(id)

    @view = new Parsebackbone.Views.GameScores.EditView(model: game_score)
    $("#game_scores").html(@view.render().el)
  