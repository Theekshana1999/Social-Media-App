const express = require('express');
const router = express.Router();
const AdminController = require("../controllers/admin.controller");
const {verifyAdmin} = require('../middleware/authMiddleware');

router.post('/create-admin', AdminController.CreateAdmin);
router.get('/get-admin',verifyAdmin, AdminController.GetAdminProfile);

module.exports = router;