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
  posts = new MyApp.Collections.Posts
  posts.fetch().done ->
    ReactDOM.render( MyApp.Views.Blog(collection: posts), document.getElementById('blog-page-wrapper'))
