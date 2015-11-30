@Comment = React.createClass(
  mixins: [Backbone.React.Component.mixin]
  destroy: -> 
    @getModel().destroy()
  rawMarkup: ->
    converter = new (Showdown.converter) 
    rawMarkup = converter.makeHtml(@props.model.get('text'), sanitize: true)
    { __html: rawMarkup }
  render: ->
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
      </footer>
    </article>`
)

MyApp.Views.Comment = React.createFactory(@Comment)