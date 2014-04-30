DArt.Models.User = Backbone.Model.extend({

  urlRoot: "/api/users",

  parse: function (jsonResp) {
    if (jsonResp.deviations){
      this._deviations = new DArt.Collections.Deviations(jsonResp.deviations);

      delete jsonResp.deviations;
    }

    if (jsonResp.journals){
      this._journals = new DArt.Collections.Journals(jsonResp.journals);

      delete jsonResp.journals;
    }

    if (jsonResp.galleries){
      this._galleries = new DArt.Collections.Galleries(jsonResp.galleries);

      delete jsonResp.galleries;
    }

    return jsonResp
  }


});