DArt.Views.UsersNotifications = Backbone.View.extend({

  tagName: "section",
  className: "notifications",
  template: JST["users/notifications"],
  render: function () {
    var that = this

     DArt.user._notifications.each(function(note){
        that.$el.append(
          JST['notifications/preview']({
            model: note
          })
        )
      })

    return this
  }

})
