Parsebackbone.Views.GameScores ||= {}

class Parsebackbone.Views.GameScores.GameScoreView extends Backbone.View
  template: JST["backbone/templates/game_scores/game_score"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))    
    return this