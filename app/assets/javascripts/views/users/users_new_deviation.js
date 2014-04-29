DArt.Views.UsersNewDeviation = Backbone.View.extend({
  template: JST["users/newDeviation"],

  render: function () {
    var content = this.template({
      user: DArt.user
    })

    this.$el.html(content)

    return this
  }

})