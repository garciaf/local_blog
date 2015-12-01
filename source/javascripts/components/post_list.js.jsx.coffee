@PostList = React.createClass(
  mixins: [Backbone.React.Component.mixin]
  render: ->
    postNodes = @getCollection().map((post) ->
      `<Post model={post} key={post.cid} />`
    )
    `<div>
      {postNodes}
    </div>`
)

MyApp.Views.PostList = React.createFactory(@PostList)