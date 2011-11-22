Parsebackbone.Views.GameScores ||= {}

class Parsebackbone.Views.GameScores.EditView extends Backbone.View
  template : JST["backbone/templates/game_scores/edit"]
  
  events :
    "submit #edit-game_score" : "update"
    
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.save(null,
      success : (game_score) =>
        @model = game_score
        window.location.hash = "/#{@model.id}"
    )
    
  render : ->
    $(this.el).html(this.template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this