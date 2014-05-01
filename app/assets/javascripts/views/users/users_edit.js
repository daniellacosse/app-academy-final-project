DArt.Views.UsersEdit = Backbone.View.extend({

  template: JST['users/edit'],

  events: {
    "submit" : "update"
  },

  update: function (event) {

      event.stopPropagation();
      event.preventDefault();

      var data = new FormData(document.getElementById("user-edit"));

      $.ajax({
          url: "/api/users/" + DArt.user.get("id"),
          type: "PATCH",
          data: data,
          dataType: "json",
          processData: false,
          contentType: false,
          success: function () {
            DArt.router.navigate("", {trigger: true})
          }
      })
  },

  render: function () {
    var content = this.template({
      user: DArt.user
    })

    this.$el.html(content)

    return this
  }

});