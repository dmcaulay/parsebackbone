Parsebackbone.Views.Players ||= {}

class Parsebackbone.Views.Players.NewView extends Backbone.View    
  template: JST["backbone/templates/players/new"]
  
  events:
    "submit #new-player": "save"
    
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
      success: (player) =>
        @model = player
        window.location.hash = "/#{@model.id}"
        
      error: (player, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this