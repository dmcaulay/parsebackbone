Parsebackbone.Views.Players ||= {}

class Parsebackbone.Views.Players.ShowView extends Backbone.View
  template: JST["backbone/templates/players/show"]
   
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this