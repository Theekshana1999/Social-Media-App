const express = require('express');
const router = express.Router();
const PostControler = require('../controllers/post.controller');


router.post('/create-post', PostControler.CreatePost);
router.get('/get-posts', PostControler.GetPosts);