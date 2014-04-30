DArt.Views.UsersEdit = Backbone.View.extend({

  template: JST['users/edit'],

  events: {
    "submit" : "update"
  },

  update: function (event) {

    event.preventDefault();
    // updating...

    DArt.user.save($(event.target).serializeJSON(), {
        patch: true,
        success: function(){
          DArt.router.navigate("", {trigger: true});
        }
      }
    )
  },

  render: function () {
    var content = this.template({
      user: DArt.user
    })

    this.$el.html(content)

    return this
  }

});