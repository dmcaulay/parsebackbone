Parsebackbone.Views.Players ||= {}

class Parsebackbone.Views.Players.IndexView extends Backbone.View
  template: JST["backbone/templates/players/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    
    @options.players.bind('reset', @addAll)
   
  addAll: () ->
    @options.players.each(@addOne)
  
  addOne: (player) ->
    view = new Parsebackbone.Views.Players.PlayerView({model : player})
    @$("tbody").append(view.render().el)
       
  render: ->
    $(@el).html(@template(players: @options.players.toJSON() ))
    @addAll()
    
    return this