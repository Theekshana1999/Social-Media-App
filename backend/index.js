const express = require("express");
const sequelize = require("./configuration/dbConnection");
const userRouter = require("./routes/user.routes");
const advertisementRoutes = require("./routes/Advertisement.routes");


const app = express();
app.use(express.json());


app.use("/api/users", userRouter);
app.use("/api/advertisements", advertisementRoutes);


const port = 5000;

sequelize.sync({force: false}).then(() =>{
    app.listen(port, () => console.log(`Server running on http://localhost:${port}`))
}).catch(err => console.log("DB Error: ", err));