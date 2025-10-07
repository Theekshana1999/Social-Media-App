const express = require('express');
const router = express.Router();
const PostControler = require('../controllers/post.controller');
const {verifyAdmin} = require("../middleware/authMiddleware");
const {upload} = require('../configuration/cloudinary')

router.post('/create-post',upload.single("image"), PostControler.CreatePost);
router.get('/get-posts', PostControler.GetPosts);
router.get('/get-post/:id', PostControler.GetPostsById);
router.post('/status/:id', verifyAdmin, PostControler.UpdatePostStatus);


module.exports = router;