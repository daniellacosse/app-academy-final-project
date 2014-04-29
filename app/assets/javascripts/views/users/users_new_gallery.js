DArt.Views.UsersNewGallery = Backbone.View.extend({
  template: JST["users/newGallery"],

  render: function () {
    var content = this.template({
      user: DArt.user
    })

    this.$el.html(content)

    return this
  }

})