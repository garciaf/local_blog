MyApp.Collections.Posts = Backbone.Collection.extend
  model: MyApp.Models.Post
  localStorage: new Backbone.LocalStorage("postCollection")
