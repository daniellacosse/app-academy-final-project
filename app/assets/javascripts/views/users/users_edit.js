DArt.Views.UsersEdit = Backbone.View.extend({

  template: JST['users/edit'],

  event: {
    "submit #user-edit" : "update"
  },

  update: function (event) {
    event.preventDefault();

    console.log(event.target);

    // dArt.user.save(serializeJSON(event.target), {
    //   patch: true,
    //   success: function(){
    //   //render 'updated' notice
    // })

    //go to user show
  },

  render: function () {
    var content = this.template({
      user: DArt.user
    })

    this.$el.html(content)

    return this
  }

});
