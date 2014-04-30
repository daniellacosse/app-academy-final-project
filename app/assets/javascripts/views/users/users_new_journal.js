DArt.Views.UsersNewJournal = Backbone.View.extend({
  template: JST["users/newJournal"],

  update: function (event) {

    event.preventDefault();
    // updating...
    DArt.Model.Journal.save($(event.target).serializeJSON(), function(){

    })

  },

  render: function () {
    var content = this.template({
      user: DArt.user
    })

    this.$el.html(content)

    return this
  }

})