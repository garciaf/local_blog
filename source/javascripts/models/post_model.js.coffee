MyApp.Models.Post = Backbone.Model.extend
  
  htmlText: ->
    converter = new (Showdown.converter) 
    converter.makeHtml(@get('text'), sanitize: true)
  
  validate: (attributes, options) ->
    author = attributes.author.trim()
    text = attributes.text.trim()
    title = attributes.title.trim()
    if !text or !author or !title
      return "can't text or author be blank"
  