Template.errors.helpers errors: ->
  Errors.find()
Template.error.onRendered ->
  error = @data
  Meteor.setTimeout (->
    Errors.remove error._id
    return
  ), 3000
  return