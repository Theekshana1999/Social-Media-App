const { Post, User } = require('../associations/associations');

exports.CreatePost = async (req, res) => {
    try {
        const post = await Post.create(req.body);
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
