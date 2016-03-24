if (window.mead_project === undefined) window.mead_project = {};

window.mead_project.busca_cep = function() {

  var pub = {};
  var priv = {};

  priv.busca_cep = function(event) {
    var target, cep, element, element_pai, cepAttributes;
    var isNonstandard = false;
    var isServico = false;
    target = (event.currentTarget) ? event.currentTarget : event.srcElement;
    cep = target.value.replace(/\D/g, '');

    if (cep!=''){
      element = $(target);

      if (element.attr("data-cep-attributes") == undefined) {
        element_pai = element.closest('div.panel-body');
      } else {
        cepAttributes = JSON.parse(element.attr("data-cep-attributes"));
        element_pai = $(cepAttributes.div_pai);
        isNonstandard = true
      }

      if (element.attr("data-cep-find_or_create") != undefined){
        isServico = true
      }

      element_pai.block({
        message: 'Buscando endereço, aguarde...'
      });

      $.getJSON("/application/busca_por_cep/" + cep,
        function ( data ) {
          if (isNonstandard == true) {
            if (isServico == true ) {
              priv.fillIsServico(cepAttributes, data, element_pai);
            } else {
              priv.fillNonstandard(cepAttributes, data, element_pai);
            }
          } else {
            priv.fillStandard(element_pai, data) ;
          }
        }
      );

    }
  }

  pub.init = function() {
    $(".cep").on('change', priv.busca_cep);
  }

  return pub;
}();

$(document).ready(function () {
  mead_project.busca_cep.init();
});