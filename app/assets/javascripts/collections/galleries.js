DArt.Collections.Galleries = Backbone.Collection.extend({

  model: DArt.Models.Gallery,
  url: function(){
   return "/api/users/" + DArt.user.get("id") + "/galleries"
  }

});
