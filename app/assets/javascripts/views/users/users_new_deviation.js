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

    var data = new FormData(document.getElementById("upload-art"));

    console.log(document.getElementById("upload-art"))
    console.log(data);

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
          alert("lol you thought that would work");
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