const express = require('express');
const router = express.Router();
const AdvertisementController = require("../controllers/Advertisement.controller");

router.post("/create-add",AdvertisementController.CreateAdvertisement);
router.get("/get-ads",AdvertisementController.GetAdvertisement);

module.exports = router;