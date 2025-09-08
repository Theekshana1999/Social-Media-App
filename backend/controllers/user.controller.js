const User = require("../models/user.model");
const {generateUserToken} = require('../middleware/GenerateToken');
 

exports.Signup = async (req,res) =>{
    const {nic,phone,password} = req.body;
    try {
        const user = await User.create({nic,phone,password});
        

        // delete password for sequrity
        const userData = { ...user.get() };
        delete userData.password;

        res.status(201).json({
        message: "User registered successfully",
        user: userData,
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({message: "Can not Signup User", error: error});
    }
}

exports.Signin = async (req, res) => {
    const {phone, password} = req.body;
  try {
    const user = await User.findOne({where:{phone}});
    if(!user) {
      return res.status(400).json({message: "invalid Credentials"});
    }

    const isMatch = await user.comparePassword(password);
    if(!isMatch){
      return res.status(400).json({ message: "Password does not match" });
    }

    const token = await generateUserToken(user.user_id);

    // delete password for sequrity
    const userData = { ...user.get() };
    delete userData.password;

    res.status(200).json({
      message: "Login Successful",
      token,
      user:userData,
    });
  } catch (error) {
    console.error("Signin error:", error);
    res.status(500).json({ message: "Cannot signin user" });
  }
};