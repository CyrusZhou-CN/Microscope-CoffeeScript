Template.registerHelper 'pluralize', (n, thing) ->
  # fairly stupid pluralizer
  if n == 1
    '1 ' + thing
  else
    n + ' ' + thing + 's'