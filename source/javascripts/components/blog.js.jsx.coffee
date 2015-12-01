@Blog = React.createClass(
  mixins: [Backbone.React.Component.mixin]

  componentWillUnmoun: -> 
    @off(@)
  render: ->
    `<div className="Blog">
        <PostList collection={this.getCollection()} />
        <article className="post">
          <PostForm collection={this.getCollection()} />
        </article>
      </div>`
)

MyApp.Views.Blog = React.createFactory(@Blog)