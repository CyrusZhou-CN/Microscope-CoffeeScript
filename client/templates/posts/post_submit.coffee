Template.postSubmit.onCreated ->
  Session.set 'postSubmitErrors', {}
  return
Template.postSubmit.helpers
  errorMessage: (field) ->
    Session.get('postSubmitErrors')[field]
  errorClass: (field) ->
    if ! !Session.get('postSubmitErrors')[field] then 'has-error' else ''
Template.postSubmit.events 'submit form': (e) ->
  e.preventDefault()
  post = 
    url: $(e.target).find('[name=url]').val()
    title: $(e.target).find('[name=title]').val()
  console.log(post)
  errors = validatePost(post)
  console.log(errors)
  if errors.title or errors.url
    return Session.set 'postSubmitErrors', errors
  Meteor.call 'postInsert', post, (error, result) ->
    # display the error to the user and abort
    if error
      return throwError error.reason
    # show this result but route anyway
    if result.postExists
      throwError 'This link has already been posted'
    Router.go 'postPage', _id: result._id
    return
  return