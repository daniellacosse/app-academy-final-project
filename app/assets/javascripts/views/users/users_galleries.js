DArt.Views.UsersGalleries = Backbone.View.extend({
  template: JST["users/galleries"],

  render: function () {
    var content = this.template({
      user: DArt.user
    })

    this.$el.html(content)

    return this
  }

})