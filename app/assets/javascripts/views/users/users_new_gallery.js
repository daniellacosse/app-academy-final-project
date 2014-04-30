DArt.Views.UsersNewGallery = Backbone.View.extend({
  template: JST["users/newGallery"],

  events: {
    "submit" : "update"
  },

  update: function (event) {

    event.preventDefault();
    // updating...
    DArt.Model.Gallery.save($(event.target).serializeJSON(), function(){

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