class Parsebackbone.Models.Post extends Backbone.Model
  paramRoot: 'post'
  idAttribute: 'objectId'

  defaults:
    title: null
    content: null
  
class Parsebackbone.Collections.PostsCollection extends Backbone.Collection
  model: Parsebackbone.Models.Post
  url: '/posts'