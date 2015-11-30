@CommentList = React.createClass(
  mixins: [Backbone.React.Component.mixin]
  render: ->
    commentNodes = @getCollection().map((comment) ->
      `<Comment model={comment} key={comment.cid} />`
    )
    `<div>
      {commentNodes}
    </div>`
)

MyApp.Views.CommentList = React.createFactory(@CommentList)