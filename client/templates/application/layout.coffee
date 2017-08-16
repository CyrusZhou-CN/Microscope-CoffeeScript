Template.layout.onRendered ->
  @find('#main')._uihooks =
    insertElement: (node, next) ->
      $(node).hide().insertBefore(next).fadeIn()
      return
    removeElement: (node) ->
      $(node).fadeOut ->
        $(this).remove()
        return
      return
  return