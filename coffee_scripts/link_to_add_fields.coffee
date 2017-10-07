$(document).on 'click', '[data-link-to-remove-field]', (e) ->
  e.preventDefault()
  $(this).prev('input[type=hidden]').val('1')
  target = $(this).data('link-to-remove-field')
  $field = $(this).closest(target)
  $field.hide()

$(document).on 'click', '[data-link-to-add-field]', (e) ->
  e.preventDefault()
  time         = new Date().getTime()
  regexp       = new RegExp($(this).data('link-to-add-field-id'), 'g')
  fields_html  = $(this).data('link-to-add-field').replace(regexp, time)
  $(this).before(fields_html)
