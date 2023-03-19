document.addEventListener('turbolinks:load', function() {
  $(document).on('click', '.add_fields', function(event) {
    event.preventDefault();
    let association = $(this).data('association');
    let regexp_braced = new RegExp('\\[new_' + association + '\\]', 'g');
    let regexp_underscord = new RegExp('_new_' + association + '_', 'g');
    let new_id = new Date().getTime();
    let new_fields = $(this).data('fields').replace(regexp_braced, '[' + new_id + ']').replace(regexp_underscord, '_' + new_id + '_');
    $(this).before(new_fields);
  });
});
