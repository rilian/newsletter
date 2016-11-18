$(document).ready(
  function () {
    if ($('#search-field').val() == "") {
      $('#search-button').attr('disabled', true);
    }
    $('#search-field').keyup(function () {
      if ($('#search-field').val() != "")
        $('#search-button').attr('disabled', false);
      else
        $('#search-button').attr('disabled', true);
    })
  }
);
