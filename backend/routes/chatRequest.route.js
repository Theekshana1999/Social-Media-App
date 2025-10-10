const express = require("express");
const router = express.Router();
const ChatRequestController = require("../controllers/chatRequest.controller");

router.post("/request", ChatRequestController.makeRequest);
router.post("/accept", ChatRequestController.acceptRequest);

module.exports = router;
