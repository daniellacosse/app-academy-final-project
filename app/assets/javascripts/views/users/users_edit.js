DArt.Views.UsersEdit = Backbone.View.extend({

  initialize: function(){
    console.log("hey girl");
  },

  template: JST['users/edit'],

  events: {
    "submit #user-edit" : "update"
  },

  update: function (event) {

    // updating...
    event.preventDefault();
    console.log($(event.target).serializeJSON());


    // dArt.user.save($(event.target).serializeJSON(), {
    //   patch: true,
    //   success: function(){
    //   //render 'updated' notice
    // go to user show
    // })

  },

  render: function () {
    var content = this.template({
      user: DArt.user
    })

    this.$el.html(content)

    return this
  }

});
