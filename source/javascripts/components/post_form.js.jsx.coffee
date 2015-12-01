@PostForm = React.createClass(
  mixins: [Backbone.React.Component.mixin]
  getInitialState: ->
    { 
      title: ''
      author: ''
      text: ''
    }
  create: (e) ->
    e.preventDefault()
    author = @refs.author.value.trim()
    text = @refs.text.value.trim()
    title = @refs.title.value.trim()
    new_post = new MyApp.Models.Post
    new_post.set
      author: author
      text: text
      title: title
    if new_post.isValid()
      @getCollection().add new_post 
      @refs.text.value = ''
      @refs.title.value = ''
  render: ->
    `<form className="form-horizontal" onSubmit={this.create}>
        <div className="form-group">
          <input
            placeholder='Title'
            className="form-control"
            type="text"
            defaultValue={this.state.title}
            ref="title"
          />
        </div>
        <div className="form-group">
          <textarea
            className="form-control"
            rows="4" cols="50"
            placeholder='Say something'
            defaultValue={this.state.text}
            ref="text"
          />
        </div>
        <div className="form-group">
          <input
            placeholder='Your name'
            className="form-control"
            type="text"
            defaultValue={this.state.author}
            ref="author"
          />
        </div>
        <div className="form-group">
          <input type="submit" className="btn btn-default" value="Post" />
        </div>
      </form>`
)
MyApp.Views.PostForm = React.createFactory(@PostForm)