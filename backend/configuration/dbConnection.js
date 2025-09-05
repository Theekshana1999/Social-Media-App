const {Sequelize} = require("sequelize");

const sequelize = new Sequelize("Flutter_APP", "root", "",{
    host: "localhost",
    dialect: "mysql",
});



module.exports = sequelize;