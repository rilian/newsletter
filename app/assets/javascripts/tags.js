$( document ).ready(function() {
  $('.select-tags').select2({
         tags: true,
         multiple: true,
         tokenSeparators: [",", " "]
  });
}); 
