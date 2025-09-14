const {User} = require("../associations/associations");
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

// 
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



exports.EditProfile = async (req,res) => {
   const {id} = req.params;
   const {falst_name, middle_name, last_name, gender, marriage_status, income, image, district, height, weight } = req.body;
  try {
    const user = await User.findByPk(id);
    if(!user){
      return res.status(400).json({message:"User Not Found.!"});
    }

    user.falst_name = falst_name ?? user.falst_name;
    user.middle_name = middle_name ?? user.middle_name;
    user.last_name = last_name ?? user.last_name;
    user.gender = gender ?? user.gender;
    user.marriage_status = marriage_status ?? user.marriage_status;
    user.income = income ?? user.income;
    user.image = image ?? user.image;
    user.district = district ?? user.district;
    user.height = height ?? user.height;
    user.weight = weight ?? user.weight;

    await user.save();
    res.json(user);

  } catch (error) {
    console.error("Can't update User profile:", error);
    res.status(500).json({ message: "Can't Update Profile user" });
  }
}


