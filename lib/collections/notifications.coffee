@Notifications = new Mongo.Collection 'notifications'
Notifications.allow update: (userId, doc, fieldNames) ->
  ownsDocument(userId, doc) and fieldNames.length == 1 and fieldNames[0] == 'read'

@createCommentNotification = (comment) ->
  post = Posts.findOne(comment.postId)
  if comment.userId != post.userId
    Notifications.insert
      userId: post.userId
      postId: post._id
      commentId: comment._id
      commenterName: comment.author
      read: false
  return