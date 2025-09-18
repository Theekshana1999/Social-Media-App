const express = require("express");
const router = express.Router();
const userController = require("../controllers/user.controller");


router.post("/sign-up",userController.Signup);
router.post("/update-profile/:id",userController.UpdateProfile);
router.get("/sign-in",userController.Signin);
router.get("/get-all-users",userController.getAllUser);
router.get("/get-user/:id",userController.getUser);

module.exports = router;