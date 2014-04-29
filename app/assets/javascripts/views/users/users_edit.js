DArt.Views.UsersEdit = Backbone.View.extend({

  initialize: function(){
    console.log("hey girl");
  },

  template: JST['users/edit'],

  events: {
    "submit #user-edit" : "update"
  },

  update: function (event) {

    event.preventDefault();
    // updating...

    dArt.user.save($(event.target).serializeJSON(), {
      patch: true,
      success: function(){

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
