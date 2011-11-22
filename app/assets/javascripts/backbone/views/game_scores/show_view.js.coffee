Parsebackbone.Views.GameScores ||= {}

class Parsebackbone.Views.GameScores.ShowView extends Backbone.View
  template: JST["backbone/templates/game_scores/show"]
   
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this