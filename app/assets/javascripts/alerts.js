$(document).ready(function(){
  $('.js-flash-close').on('click', function (e) {
    var $this = $(e.target);
    $this.closest('.flash')
      .fadeOut(300, function() { $(this).remove(); });
  });
});