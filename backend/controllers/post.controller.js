const { Post, User } = require('../associations/associations');

exports.CreatePost = async (req, res) => {
    try {
        const post = await Post.create({
            ...req.body,
            image:req.file?.path || null
        });
        res.status(201).json(post);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Cannot create Post" });
    }
}

exports.GetPosts = async (req, res) => {
    try {
        const posts = await Post.findAll({
            include: [
                {
                    model: User,
                    as: 'user',  
                    //attributes: ['user_id', 'name', 'nic', 'phone'] 
                }
            ]
        });
        res.status(200).json(posts);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: error.message });
    }
}


exports.GetPostsById = async (req, res) => {
    const {id} = req.params;
    try {
        const posts = await Post.findByPk(id,{
            include: [
                {
                    model: User,
                    as: 'user',  
                    //attributes: ['user_id', 'name', 'nic', 'phone'] 
                }
            ]
        });
        res.status(200).json(posts);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: error.message });
    }
}

exports.UpdatePostStatus = async (req,res) => {
    const {id} = req.params;
    const {post_status} = req.body;
    try {

        const post = await Post.findByPk(id);
        if(!post){
             return res.status(404).json({ message: "Post not found" });
        }

        await Post.update({post_status},{ where: { post_id: id }});
        res.status(200).json(post);
        
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

