#= require ./vendor/jquery
#= require ./vendor/underscore
#= require ./vendor/backbone
#= require ./vendor/backbone.localStorage
#= require ./vendor/react
#= require ./vendor/react-dom
#= require ./vendor/showdown

#= require ./vendor/backbone-react-component
#= require ./vendor/pusher

#= require 'app_scope'

#= require_tree './models'
#= require_tree './collections'
#= require_tree './components'


$ ->
  comments = new MyApp.Collections.Comments
  comments.fetch().done ->
    ReactDOM.render( MyApp.Views.CommentBox(collection: comments), document.getElementById('blog-page-wrapper'))
