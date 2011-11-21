Parsebackbone.Views.Players ||= {}

class Parsebackbone.Views.Players.PlayerView extends Backbone.View
  template: JST["backbone/templates/players/player"]
  
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