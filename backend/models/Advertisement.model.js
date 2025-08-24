const { DataTypes } = require('sequelize');
const sequelize = require('../configuration/dbConnection');
const User = require('./user.model');

const Advertisement = sequelize.define("Advertisement", {
  add_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  description: { type: DataTypes.TEXT, allowNull: false },
  image: { type: DataTypes.STRING },
  user_id: {  
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'Users',
      key: 'user_id',
    },
  },
});


User.hasOne(Advertisement, { foreignKey: "user_id" });
Advertisement.belongsTo(User, { foreignKey: "user_id" });

module.exports = Advertisement;
