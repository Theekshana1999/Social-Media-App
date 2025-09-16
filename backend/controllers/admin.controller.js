const Admin = require('../models/admin.model');


exports.CreateAdmin = async (req,res) => {
    try {
        const admin = await Admin.create(req.body);
        res.status(201).json(admin);
    } catch (error) {
        console.error(error);
        res.status(500).json({message: "Can not create Admin"});
    }
}

