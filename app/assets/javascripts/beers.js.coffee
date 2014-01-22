jQuery ->  
ready = ->
  $('#beers').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#beers').data('source')


$(document).ready ready
$(document).on "page:load", ready