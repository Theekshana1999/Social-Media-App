const { DataTypes } = require('sequelize');
const sequelize = require('../configuration/dbConnection');
const User = require('../models/user.model');


const Post = sequelize.define('Post', {
    post_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    post_status: {
        type: DataTypes.ENUM("Pending", "Approve"),
        defaultValue: "Pending",
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
    current_living: {
        type: DataTypes.STRING,
        allowNull: true
    },
    education: {
        type: DataTypes.STRING,
        allowNull: true
    },
    user_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        unique: true,   
        references: {
            model: User,
            key: 'user_id'
        }
    }
}, {
    tableName: 'posts',
    timestamps: false
});





module.exports = Post;
