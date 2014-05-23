DArt.Collections.Notifications = Backbone.Collection.extend({

  model: DArt.Models.Notification,
  url: function(){
   return "/api/users/" + DArt.user.get("id") + "/notifications"
  },
  comparator: function (me) {
    return -me.get("created_at")
  }

});
