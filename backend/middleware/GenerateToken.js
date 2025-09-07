const jwt = require('jsonwebtoken');
const User = require('../models/user.model');
const Admin = require('../models/admin.model');


const generateUserToken = async (userId) => {
    try {
        const user = await User.findByPk(userId);
        if(!user){
            throw new Error('User not Found.');
        }

        const token =  jwt.sign({userId: user.user_id, role: user.role}, process.env.JWT_SECRET, {expiresIn: '1h'});
        return token;
    } catch (error) {
        console.error('Error Generating token: ', error);
        throw new Error('Token Generation Fail');
    }
}

const generateAdminToken = async (adminID) => {
    try {
        const admin = await Admin.findByPk(adminID);
        if(!admin){
            throw new Error('Admin not found');
        }

        const token =  jwt.sign({adminID: admin.admin_id, role:admin.role},process.env.JWT_SECRET,{expiresIn:'1h'});
        return token;
    } catch (error) {
         console.error('Error generating token:', error);
        throw new Error('Token generation failed');
    }
}

module.exports = {
    generateUserToken,
    generateAdminToken
};