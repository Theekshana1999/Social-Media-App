const { DataTypes } = require("sequelize");
const sequelize = require("../configuration/dbConnection");

const User = sequelize.define("User", {
    nic: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    gender: {
        type: DataTypes.STRING,
        allowNull: false
    },
    marriage_Status: { 
        type: DataTypes.STRING,
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
