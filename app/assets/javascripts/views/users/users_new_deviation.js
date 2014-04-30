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

    var data = new FormData();

    $.each(this.files, function(k, v){
      debugger
      data.append(k, v)
    });

    $.ajax({
        url: "/api/deviations?files",
        type: "POST",
        data: data,
        dataType: "json",
        processData: false,
        contentType: false,
        success: function (data, textStatus, jqXHR) {
          function submitForm(event, data)
          {
            // Create a jQuery object from the form
          	$form = $(event.target);

          	// Serialize the form data
          	var formData = $form.serialize();

          	// You should sterilise the file names
          	$.each(data.files, function(key, value)
          	{
          		formData = formData + '&filenames[]=' + value;
          	});

          	$.ajax({
          		url: 'submit.php',
                  type: 'POST',
                  data: formData,
                  cache: false,
                  dataType: 'json',
                  success: function(data, textStatus, jqXHR)
                  {
                  	if(typeof data.error === 'undefined')
                  	{
                  		// Success so call function to process the form
                  		console.log('SUCCESS: ' + data.success);
                  	}
                  	else
                  	{
                  		// Handle errors here
                  		console.log('ERRORS: ' + data.error);
                  	}
                  },
                  error: function(jqXHR, textStatus, errorThrown)
                  {
                  	// Handle errors here
                  	console.log('ERRORS: ' + textStatus);
                  },
                  complete: function()
                  {
                  	// STOP LOADING SPINNER
                  }
          	});
          }


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