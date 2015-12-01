@Post = React.createClass(
  mixins: [Backbone.React.Component.mixin]
  getInitialState: ->
    edit_mode: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit_mode: !@state.edit_mode
  update: (e) ->
    @getModel().set(
      title: @refs.title.value.trim()
      author: @refs.author.value.trim()
      text: @refs.text.value.trim()
    )
    @getModel().save()
    @state.edit_mode = false
  destroy: -> 
    @getModel().destroy()
  renderPost: ->
    `<article className="post">
      <header className="post-header">
        <h2 className="post-title">
          {this.props.model.get('title')}
        </h2>
      </header>
      <section className="post-content" dangerouslySetInnerHTML={ {__html: this.props.model.htmlText()} } /> 
      <footer className="post-meta">
        <p>
          {this.props.model.get('author')}
        </p>
        <button onClick={this.destroy}>Delete</button>
        <button onClick={this.handleToggle}>Edit</button>
      </footer>
    </article>`
  renderPostEdit: ->
    `<article className="post">
      <header className="post-header">
        <input
          type="text"
          defaultValue={this.props.model.get('title')}
          ref="title"
        />
      </header>
      <section className="post-content"> 
        <textarea 
          defaultValue={this.props.model.get('text')}
          ref="text"
        />
      </section>

      <footer className="post-meta">
        <div>
          <input
            type="text"
            ref="author"
            defaultValue={this.props.model.get('author')}
          />
        </div>
        <button onClick={this.handleToggle}>Back</button>
        <button onClick={this.update}>Save</button>
      </footer>
    </article>`
  render: ->
    if @state.edit_mode
      @renderPostEdit()
    else
      @renderPost()
    
)

MyApp.Views.Post = React.createFactory(@Post)