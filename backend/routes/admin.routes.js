const express = require('express');
const router = express.Router();
const AdminController = require("../controllers/admin.controller");


router.post('/create-admin', AdminController.CreateAdmin);

