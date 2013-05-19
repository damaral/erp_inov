// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree

$(document).ready(function(){
  datepicker_format();

  /*$('.simple_form').on('click', '.money', function(){
    $(this).val($(this).val().replace("R$ ", ""));
    $(this).val($(this).val().replace(".", ","));
    $(this).val($(this).val().replace(",", "."));

    $(this).maskMoney({showSymbol:true, symbol:"R$ ", decimal:",", thousands:"."});
  });

  /*if($(".money").length != 0){
    $(".money").val($(".money").val().replace(".", ","));
    $(".money").maskMoney({showSymbol:true, symbol:"R$ ", decimal:",", thousands:"."});
  }*/

  /*if($(".money").length != 0){
    $(".money").val($(".money").val().replace(".", ","));
    $(".money").maskMoney({showSymbol:true, symbol:"", decimal:".", thousands:","});
  }*/
});

function datepicker_format(){
  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy'
  });
}

function remove_pagamento(link){
  $(link).parent(".pagamento").find(".hidden input").val("1");
  $(link).parent(".pagamento").hide();
}

var num_pagamentos = 1000;

function adiciona_pagamento(link){
  formulario = '<div class="pagamento">' + $(".pagamento").first().html() + '</div>';
  num_pagamentos += 1;
  novo_atributo = 'os[pagamentos_attributes]['+ num_pagamentos +']';
  formulario = formulario.replace(/os\[pagamentos_attributes\]\[0\]/g, novo_atributo);
  formulario = formulario.replace('[_destroy]" type="hidden" value="1"', '[_destroy]" type="hidden" value="false"');

  

  $('.pagamentos').append(formulario);
  datepicker_format();
}

function remove_item(link){
  $(link).parent(".item").find(".hidden input").val("1");
  $(link).parent(".item").hide();
}

var num_produtos = 1000;

function adiciona_item(link){
  formulario = '<div class="item">' + $(".item").first().html() + '</div>';
  num_produtos += 1;
  novo_atributo = 'os[itens_attributes]['+ num_produtos +']';
  formulario = formulario.replace(/os\[itens_attributes\]\[0\]/g, novo_atributo);
  formulario = formulario.replace('[_destroy]" type="hidden" value="1"', '[_destroy]" type="hidden" value="false"');

  

  $('.produtos').append(formulario);
}