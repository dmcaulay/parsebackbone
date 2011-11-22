Parsebackbone.Views.GameScores ||= {}

class Parsebackbone.Views.GameScores.IndexView extends Backbone.View
  template: JST["backbone/templates/game_scores/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    
    @options.gameScores.bind('reset', @addAll)
   
  addAll: () ->
    @options.gameScores.each(@addOne)
  
  addOne: (gameScore) ->
    view = new Parsebackbone.Views.GameScores.GameScoreView({model : gameScore})
    @$("tbody").append(view.render().el)
       
  render: ->
    $(@el).html(@template(gameScores: @options.gameScores.toJSON() ))
    @addAll()
    
    return this