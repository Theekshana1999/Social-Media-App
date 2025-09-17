const Admin = require('../models/admin.model');
const {generateAdminToken} = require('../middleware/GenerateToken');



exports.CreateAdmin = async (req,res) => {
    try {
        const admin = await Admin.create(req.body);

        const token = await generateAdminToken(admin.admin_id);

        const { password, ...adminData } = admin.toJSON();

        res.status(201).json({ admin: adminData, token });
    } catch (error) {
        console.error(error);
        res.status(500).json({message: "Can not create Admin"});
    }
}


exports.GetAdminProfile = async (req,res) => {
    try {
        const admin = req.admin;
        if(!admin){
            return res.status(404).json({ message: "Admin not found" });
        
        }

        const token = await generateAdminToken(admin.admin_id);

        const {password, ...adminData} = admin.toJSON();

        res.status(200).json({ admin: adminData, token });
    } catch (error) {
        console.error(error);
    res.status(500).json({ message: "Cannot fetch admin profile" });
    }
}

