class Parsebackbone.Routers.PlayersRouter extends Backbone.Router
  initialize: (options) ->
    @players = new Parsebackbone.Collections.PlayersCollection()
    @players.reset options.players

  routes:
    "/new"      : "newPlayer"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newPlayer: ->
    @view = new Parsebackbone.Views.Players.NewView(collection: @players)
    $("#players").html(@view.render().el)

  index: ->
    @view = new Parsebackbone.Views.Players.IndexView(players: @players)
    $("#players").html(@view.render().el)

  show: (id) ->
    player = @players.get(id)
    
    @view = new Parsebackbone.Views.Players.ShowView(model: player)
    $("#players").html(@view.render().el)
    
  edit: (id) ->
    player = @players.get(id)

    @view = new Parsebackbone.Views.Players.EditView(model: player)
    $("#players").html(@view.render().el)
  