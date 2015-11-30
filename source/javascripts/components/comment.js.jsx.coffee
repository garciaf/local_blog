@Comment = React.createClass(
  mixins: [Backbone.React.Component.mixin]
  getInitialState: ->
    edit_mode: false
    new_title: @getModel().get('title')
    new_text: @getModel().get('text')
    new_author: @getModel().get('author')
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit_mode: !@state.edit_mode
  handleTitleChange: (e) ->
    e.preventDefault()
    @setState new_title: e.target.value
  handleAuthorChange: (e) ->
    e.preventDefault()
    @setState new_author: e.target.value
  handleTextChange: (e) ->
    e.preventDefault()
    @setState new_text: e.target.value
  update: (e) ->
    @getModel().set(
      title: @state.new_title.trim()
      author: @state.new_author.trim()
      text: @state.new_text
    )
    @getModel().save()
    @state.edit_mode = false
  destroy: -> 
    @getModel().destroy()
  rawMarkup: ->
    converter = new (Showdown.converter) 
    rawMarkup = converter.makeHtml(@props.model.get('text'), sanitize: true)
    { __html: rawMarkup }
  renderComment: ->
    `<article className="post">
      <header className="post-header">
        <h2 className="post-title">
          {this.props.model.get('title')}
        </h2>
      </header>
      <section className="post-content" dangerouslySetInnerHTML={this.rawMarkup()} /> 
      <footer className="post-meta">
        <p>
          {this.props.model.get('author')}
        </p>
        <button onClick={this.destroy}>Delete</button>
        <button onClick={this.handleToggle}>Edit</button>
      </footer>
    </article>`
  renderCommentEdit: ->
    `<article className="post">
      <header className="post-header">
        <input
          type="text"
          defaultValue={this.props.model.get('title')}
          onChange={this.handleTitleChange}
        />
      </header>
      <section className="post-content"> 
        <textarea 
          defaultValue={this.props.model.get('text')}
          onChange={this.handleTextChange}
        />
      </section>

      <footer className="post-meta">
        <div>
          <input
            type="text"
            defaultValue={this.props.model.get('author')}
            onChange={this.handleAuthorChange}
          />
        </div>
        <button onClick={this.handleToggle}>Back</button>
        <button onClick={this.update}>Save</button>
      </footer>
    </article>`
  render: ->
    if @state.edit_mode
      @renderCommentEdit()
    else
      @renderComment()
    
)

MyApp.Views.Comment = React.createFactory(@Comment)