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

exports.getUser = async (req, res) => {
  const {id} = req.params;
  try {
    const user = await User.findByPk(id);
    if(!user){
      return res.status(400).json({message:"User Not Found.!"});
    }
    res.status(200).json(user);
  } catch (error) {
    console.error("Can't Find User By Id:", error);
    res.status(500).json({ message: "Can't Find user by id" });
  }
}

exports.getAllUser = async (req,res) => {
  try {
    const users = await User.findAll();
    if(!users){
      return res.status(400).json({message:"Can't find Users"});
    }
    res.status(200).json(users);
  } catch (error) {
    console.error("Can't Get All Users:", error);
    res.status(500).json({ message: "Can't Get All Users:" });
  }
}

exports.UpdateProfile = async (req,res) => {
   const {id} = req.params;
   const {first_name, middle_name, last_name, gender, marriage_status, income, image, district, height, weight } = req.body;
  try {
    const user = await User.findByPk(id);
    if(!user){
      return res.status(400).json({message:"User Not Found.!"});
    }

    user.first_name = first_name ?? user.first_name;
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

exports.verifyEmail =  async (req,res) => {
    const {email, user_id} = req.body;
  try {
    const user = await User.findOne({where:{email}});
    if(!user){
      return res.status(404).json({message: "user not found.!"})
    }

    const otp = Math.floor(100000 + Math.random()*900000).toString();
    const expiryTime = Date.now() + 10 * 60 * 1000;

    user.verifyOTP = otp;
    user.verifyOTPExpires = expiryTime;

    await user.save();

    const otpTransporter = nodemailer.createTransport({
      
    })

  } catch (error) {
    
  }
}




