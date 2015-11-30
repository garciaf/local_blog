MyApp.Collections.Comments = Backbone.Collection.extend
  model: MyApp.Models.Comment
  localStorage: new Backbone.LocalStorage("commentCollection")
