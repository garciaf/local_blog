@CommentBox = React.createClass(
  mixins: [Backbone.React.Component.mixin]

  handleCommentSubmit: (comment_hash) ->
    @getCollection().create comment_hash,
      error: ((xhr, status, err) ->
        console.error @props.url, status, err.toString()
      ).bind(this)
  componentWillUnmoun: -> 
    @off(@)
  render: ->
    `<div className="commentBox">
        <CommentList collection={this.getCollection()} />
        <article className="post">
          <CommentForm onCommentSubmit={this.handleCommentSubmit} />
        </article>
      </div>`
)

MyApp.Views.CommentBox = React.createFactory(@CommentBox)