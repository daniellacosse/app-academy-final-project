DArt.Views.UsersNewDeviation = Backbone.View.extend({
  template: JST["users/newDeviation"],

  events: {
    "submit" : "update"
  },

  update: function (event) {

    event.preventDefault();

    DArt.Model.Deviation.save($(event.target).serializeJSON(), function(){

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