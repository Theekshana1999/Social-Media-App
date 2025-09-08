const jwt = require("jsonwebtoken");
const User = require("../models/user.model");
const Admin = require("../models/admin.model");



const verifyUser = async (req , res, next) => {
    try {
        const token = req.headers.authorization?.split(" ")[1];
        if(!token){
            return res.status(401).json({message: "unauthorized"});
        }

        const decoded = jwt.verify(token,process.env.JWT_SECRET);
        const user = await User.findByPk(decoded.id);
        if(!user){
            return res.status(401).json({message: "user not fund"});
        }

        res.user = user;
        next();

    } catch (error) {
        res.status(401).json({ message: "Invalid token" });
    }
}

const verifyAdmin = async (req,res,next) => {
    try {
        const token = req.headers.authorization?.split("")[1];
        if (!token){
             return res.status(401).json({ message: "Unauthorized" });
        }

       const decoded = jwt.verify(token, process.env.JWT_SECRET);
       const admin = await Admin.findByPk(decoded.id);
      if (!admin) {
        return res.status(401).json({ message: "Admin not found" });
      }

      req.admin = admin;
      next();
    } catch (error) {
         res.status(401).json({ message: "Invalid token" });
    }
}

module.exports = {verifyUser, verifyAdmin};




