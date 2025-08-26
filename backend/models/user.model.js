const { DataTypes } = require("sequelize");
const sequelize = require("../configuration/dbConnection");

const User = sequelize.define("User", {
    
  user_id: { 
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true 
    },
  nic: { 
    type: DataTypes.STRING, 
    allowNull: false, 
    unique: true 
    },
  name: { 
    type: DataTypes.STRING, 
    allowNull: false 
    },
  gender: { 
    type: DataTypes.ENUM("Male", "Female", "Other"), 
    allowNull: false 
    },
  marriage_status: { 
    type: DataTypes.ENUM("Single", "Married"), 
    allowNull: false 
    },
  income: { 
    type: DataTypes.FLOAT, 
    allowNull: false 
    },
  district: { 
    type: DataTypes.STRING, 
    allowNull: false 
    },
  other: {
        type: DataTypes.STRING,
        allowNull: true 
    }
});



module.exports = User;
