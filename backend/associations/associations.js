const User = require('../models/user.model');
const Post = require('../models/post.model');
const ChatRequest = require('../models/ChatRequest');


User.hasOne(Post,{foreignKey:'user_id', as: 'post'});
Post.belongsTo(User,{foreignKey: 'user_id', as: 'user'});
User.belongsToMany(User, {
  through: ChatRequest,
  as: "SentRequests",
  foreignKey: "senderId",
  otherKey: "receiverId"
});

User.belongsToMany(User, {
  through: ChatRequest,
  as: "ReceivedRequests",
  foreignKey: "receiverId",
  otherKey: "senderId"
});




module.exports = {User, Post,ChatRequest };