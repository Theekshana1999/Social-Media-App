const { DataTypes } = require('sequelize');
const sequelize = require('../configuration/dbConnection');
const User = require('./user.model');
const Advertisement = require('./Advertisement.model');


const Post = sequelize.define("Post",{
    post_id: {
        type: DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    post_status: { 
        type: DataTypes.STRING,
        allowNull: false 
    },
    posted_date: { 
        type: DataTypes.DATE, 
        defaultValue: DataTypes.NOW 
    },
    delete_date: { 
        type: DataTypes.DATE 
    },
    post_like: { 
        type: DataTypes.INTEGER, 
        defaultValue: 0 
    },
    other_details: {
        type: DataTypes.STRING,
        allowNull: true 
    },
    current_living:{
        type: DataTypes.STRING,
        allowNull: true 
    },
    education:{
        type: DataTypes.STRING,
        allowNull: true
    },
    user_id: {  
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'User',
      key: 'user_id',
    },
  },

});

User.hasOne(Post,{foreignKey:"user_id"});
Post.belongsTo(User,{foreignKey:"user_id"});

module.exports = Post;