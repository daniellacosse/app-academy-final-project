DArt.Views.UsersJournals = Backbone.View.extend({
  template: JST["users/journals"],

  render: function () {
    var content = this.template({
      user: DArt.user
    })

    this.$el.html(content)

    return this
  }

})