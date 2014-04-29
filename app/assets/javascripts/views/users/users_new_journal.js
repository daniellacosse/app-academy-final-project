DArt.Views.UsersNewJournal = Backbone.View.extend({
  template: JST["users/newJournal"],

  render: function () {
    var content = this.template({
      user: DArt.user
    })

    this.$el.html(content)

    return this
  }

})