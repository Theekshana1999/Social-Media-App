const User = require('../models/user.model');
const Post = require('../models/post.model');


User.hasOne(Post,{foreignKey:'user_id', as: 'post'});
Post.belongsTo(User,{foreignKey: 'user_id', as: 'user'});



module.exports = {User, Post};