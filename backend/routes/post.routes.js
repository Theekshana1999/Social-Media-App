const express = require('express');
const router = express.Router();
const PostControler = require('../controllers/post.controller');


router.post('/create-post', PostControler.CreatePost);
router.get('/get-posts', PostControler.GetPosts);
router.get('/get-post/:id', PostControler.GetPostsById);
router.post('/status/:id', PostControler.UpdatePostStatus);


module.exports = router;