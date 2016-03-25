if (window.mead_project === undefined) window.mead_project = {};

window.mead_project.search_postal_code = function() {

  var pub = {};
  var priv = {};

  priv.search_postal_code = function(event) {
    postal_code = $(this).val().replace(/\D/g, '');
    if (postal_code != ''){
      $.getJSON("/adresses/search_postal_code/" + postal_code,
        function ( data ) {
          priv.fill(data) ;
        }
      );
    }
  }

  priv.disableCities = function(){
    if ( $("#profile_address_attributes_state_id").val == '' ) {
      $("#profile_address_attributes_city_id option").hide();
    } else {
      var symbol = $("#profile_address_attributes_state_id option:selected").data("symbol")
      $("#profile_address_attributes_city_id option").hide();
      $("#profile_address_attributes_city_id option[data-symbol=" + symbol + "]").show();
    }
  }

  priv.fill = function(data) {
    $("#profile_address_attributes_state_id").val(data.uf).change();
    $("#profile_address_attributes_district").val(data.bairro).change();
    $("#profile_address_attributes_street").val(data.logradouro).change();
    $("#profile_address_attributes_city_id").val(data.cidade).change();
  }

  priv.getCitiesFromState = function(){
    priv.disableCities()
  }

  pub.init = function() {
    priv.disableCities()
    $("#profile_address_attributes_postal_code").on('change', priv.search_postal_code);
    $("#profile_address_attributes_state_id").on('change', priv.getCitiesFromState);

  }

  return pub;
}();

$(document).ready(function () {
  mead_project.search_postal_code.init();
});