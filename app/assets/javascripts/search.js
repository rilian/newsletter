$(document).ready(
  function () {
    if ($('#search-field').val() == "") {
      $('#search-button').attr('disabled', true);
    }
    $('#search-field').keyup(function () {
      $('#search-button').attr('disabled', !($('#search-field').val() != ""));
    })
  }
);
