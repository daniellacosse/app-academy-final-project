DArt.Collections.Journals = Backbone.Collection.extend({

  model: DArt.Models.Journal,
  url: function(){
   return "/api/users/" + DArt.user.get("id") + "/journals"
  },
  comparator: function (me) {
    return -me.get("created_at")
  }

});