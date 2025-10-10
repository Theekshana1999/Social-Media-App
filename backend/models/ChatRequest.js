const { DataTypes } = require("sequelize");
const sequelize = require("../configuration/dbConnection");

const ChatRequest = sequelize.define(
  "ChatRequest",
  {
    status: {
      type: DataTypes.ENUM("pending", "accepted", "rejected"),
      defaultValue: "pending",
    },
  },
  {
    tableName: "ChatRequests",
    timestamps: true,
  }
);

module.exports = ChatRequest;
