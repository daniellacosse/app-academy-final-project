DArt.Views.UsersNewGallery = Backbone.View.extend({
  template: JST["users/newGallery"],

  events: {
    "submit" : "newGallery"
  },

  newGallery: function (event) {

    event.preventDefault();
    // updating...

    model = new DArt.Models.Gallery($(event.target).serializeJSON());

    DArt.user._galleries.create(model, {
        patch: true,
        success: function(){
          DArt.router.navigate("galleries", {trigger: true});
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