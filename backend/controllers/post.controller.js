const Post = require('../models/post.model');
const User = require('../models/user.model');


exports.CreatePost= async (req,res) =>{
    try {
        const post = await Post.create(req.body);
        res.status(201).json(post);
    } catch (error) {
        console.error(error);
        res.status(500).json({message: "Can not create Post"});

    }
    
}

exports.GetPosts = async (req,res) =>{
    try {
        const post = await Post.findAll({ include: User });
        res.status(200).json(post);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
}