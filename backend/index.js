const express = require("express");
const sequelize = require("./configuration/dbConnection");

require("./models/admin.model");
require("./models/post.model");
require("./models/user.model");


const dotenv = require("dotenv");
dotenv.config();
const app = express();
const port = 5000;

const userRoutes = require('./routes/user.routes');
const postRoutes = require('./routes/post.routes');



app.use(express.json());


app.use('/api/user',userRoutes);
app.use('/api/post',postRoutes);







(async () => {
  try {
    await sequelize.sync({ alter: true });
    console.log("Database synced successfully.");

    app.listen(port, () => {
      console.log(`Server running on http://localhost:${port}`);
    });
  } catch (error) {
    console.error("Error syncing database:", error);
    process.exit(1);
  }
})();