DArt.Views.UsersNewJournal = Backbone.View.extend({
  template: JST["users/newJournal"],

  events: {
    "submit" : "newJournal"
  },

  newJournal: function (event) {

    event.preventDefault();

    model = new DArt.Models.Journal($(event.target).serializeJSON());

    DArt.user._journals.create(model, {
        success: function(){
          debugger
          DArt.router.navigate("journals", {trigger: true});
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

})