const express = require("express");
const router = express.Router();
const userController = require("../controllers/user.controller");


router.post("/sign-up",userController.Signup);
router.get("/sign-in",userController.Signin);

module.exports = router;