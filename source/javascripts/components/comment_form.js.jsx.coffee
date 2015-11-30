@CommentForm = React.createClass(
  getInitialState: ->
    { 
      title: ''
      author: ''
      text: ''
    }
  handleTitleChange: (e) ->
    @setState title: e.target.value
  handleAuthorChange: (e) ->
    @setState author: e.target.value
    return
  handleTextChange: (e) ->
    @setState text: e.target.value
    return
  handleSubmit: (e) ->
    e.preventDefault()
    author = @state.author.trim()
    text = @state.text.trim()
    title = @state.title.trim()
    if !text or !author or !title
      return
    @props.onCommentSubmit
      author: author
      text: text
      title: title
    @setState text: '', title: ''
    return
  render: ->
    `<form className="form-horizontal" onSubmit={this.handleSubmit}>
        <div className="form-group">
          <input
            placeholder='Title'
            className="form-control"
            type="text"
            value={this.state.title}
            onChange={this.handleTitleChange}
          />
        </div>
        <div className="form-group">
          <textarea
            className="form-control"
            rows="4" cols="50"
            placeholder='Say something'
            value={this.state.text}
            onChange={this.handleTextChange}
          />
        </div>
        <div className="form-group">
          <input
            placeholder='your_name'
            className="form-control"
            type="text"
            value={this.state.author}
            onChange={this.handleAuthorChange}
          />
        </div>
        <div className="form-group">
          <input type="submit" className="btn btn-default" value="Post" />
        </div>
      </form>`
)
MyApp.Views.CommentForm = React.createFactory(@CommentForm)