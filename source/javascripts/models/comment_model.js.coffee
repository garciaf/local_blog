MyApp.Models.Comment = Backbone.Model.extend
  
  validate: (attributes, options) ->
    author = attributes.author.trim()
    text = attributes.text.trim()
    if !text or !author
      return "can't text or author be blank"
  