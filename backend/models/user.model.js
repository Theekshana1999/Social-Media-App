const { DataTypes } = require("sequelize");
const sequelize = require("../configuration/dbConnection");
const bcrypt = require("bcryptjs");

const User = sequelize.define(
  "User",
  {
    user_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    nic: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    role: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: "user",
    },
    gender: {
      type: DataTypes.ENUM("Male", "Female", "Other"),
      allowNull: true,
    },
    marriage_status: {
      type: DataTypes.ENUM("Single", "Married"),
      allowNull: true,
    },
    income: {
      type: DataTypes.FLOAT,
      allowNull: true,
    },
    image: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    district: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    height: {
      type: DataTypes.FLOAT,
      allowNull: true,
    },
    weight: {
      type: DataTypes.FLOAT,
      allowNull: true,
    },
  },
  {
    tableName: "users",
    timestamps: false,

    hooks: {
      // hash password before creating user
      beforeCreate: async (user) => {
        const salt = await bcrypt.genSalt(10);
        user.password = await bcrypt.hash(user.password, salt);
      },
      // hash password before updating if it’s changed
      beforeUpdate: async (user) => {
        if (user.changed("password")) {
          const salt = await bcrypt.genSalt(10);
          user.password = await bcrypt.hash(user.password, salt);
        }
      },
    },
  }
);

// compare password during login
User.prototype.comparePassword = async function (password) {
  return await bcrypt.compare(password, this.password);
};

module.exports = User;
