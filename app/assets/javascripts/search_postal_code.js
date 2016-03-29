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

  priv.search_city_by_symbol = function(symbol) {
    $.getJSON("/adresses/get_cities_by_symbol/" + symbol,
      function ( data ) {
        priv.fillCities(data);
      }
    );
  }

  priv.fillCities = function(data) {
    $("#profile_address_attributes_city_id").html(data);
    var city_id = $("#profile_address_attributes_state_id").data("city_id");
    console.log(city_id == "");
    if (city_id === undefined || city_id == "" ){
      $("#profile_address_attributes_city_id").val($("#profile_address_attributes_city_id option:first").val());
    }else {
      $("#profile_address_attributes_city_id").val(city_id).change();  
    }
  }

  priv.fill = function(data) {
    $("#profile_address_attributes_state_id").val(data.uf).change();
    $("#profile_address_attributes_state_id").attr("data-city_id", data.cidade);
    $("#profile_address_attributes_district").val(data.bairro).change();
    $("#profile_address_attributes_street").val(data.logradouro).change();
  }

  priv.getCitiesFromState = function(){
    var symbol = $(this).find(":selected").data("symbol");
    priv.search_city_by_symbol(symbol)
  }

  pub.init = function() {
    //priv.disableCities()
    $("#profile_address_attributes_postal_code").on('change', priv.search_postal_code);
    $("#profile_address_attributes_state_id").on('change', priv.getCitiesFromState);

  }

  return pub;
}();

$(document).ready(function () {
  mead_project.search_postal_code.init();
});