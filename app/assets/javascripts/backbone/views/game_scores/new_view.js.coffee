Parsebackbone.Views.GameScores ||= {}

class Parsebackbone.Views.GameScores.NewView extends Backbone.View    
  template: JST["backbone/templates/game_scores/new"]
  
  events:
    "submit #new-game_score": "save"
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )
    
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @model.unset("errors")
    
    @collection.create(@model.toJSON(), 
      success: (game_score) =>
        @model = game_score
        window.location.hash = "/#{@model.id}"
        
      error: (game_score, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this