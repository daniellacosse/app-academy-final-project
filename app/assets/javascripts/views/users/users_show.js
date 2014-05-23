DArt.Views.UsersShow = Backbone.View.extend({

  tagName: "section",

  events: {
    "click ._deviation" : "showDeviation"
  },

  className: "deviation-grid shrinkwrap-center",

  template: JST['users/show'],

  render: function () {

    var that = this

    DArt.user._deviations.each(function(deviation){

        that.$el.append(
          JST['deviations/preview']({
            model: deviation
          })
        )
      })

    return this

  },

  showDeviation: function (event) {
    event.preventDefault()

    var dataID = $(event.target).closest("._deviation").attr("data-id")

    $.ajax({
      method: "GET",
      url: "/api/deviations/" + dataID,
      success: function(data){
        console.log(data)
        var model = new DArt.Models.Deviation(data)

        var modal = JST["deviations/display"]({ model: model })
        console.log(modal)

        $('body').append(modal)
      }
    })
  }

});
