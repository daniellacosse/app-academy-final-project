DArt.Routers.Users = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl
  },

  routes: {
    "/users/:id/edit" : "edit"
  },

  edit: function (id) {
    var form = new DArt.Views.UserForm({
      model: user
    })
  }



});
