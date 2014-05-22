DArt.Views.UsersNewDeviation = Backbone.View.extend({

  template: JST["users/newDeviation"],

  events: {
    "change input[type=file]" : "setFiles",
    "submit" : "newDeviation"
  },

  setFiles: function (event) {
    this.files = event.target.files
  },

  newDeviation: function (event) {
    event.stopPropagation();
    event.preventDefault();

    $("input[type=submit]").attr("disabled", true)
    $("input[type=submit]").attr("value", "Uploading...")

    var data = new FormData(document.getElementById("upload-art"));

    $.ajax({
        url: "/api/deviations",
        type: "POST",
        data: data,
        dataType: "json",
        processData: false,
        contentType: false,
        success: function () {
          DArt.router.navigate("", {trigger: true})
        },
        error: function () {
          DArt.router.navigate("", {trigger: true})
          alert("there was a problem, please try again lataz")
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
