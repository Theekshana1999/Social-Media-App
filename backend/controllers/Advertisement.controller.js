const Advertisement = require('../models/Advertisement.model');
const User = require('../models/user.model');


exports.CreateAdvertisement= async (req,res) =>{
    try {
        const advertisement = await Advertisement.create(req.body);
        res.status(201).json(advertisement);
    } catch (error) {
        console.error(error);
        res.status(500).json({message: "Can not create Advertisement"});

    }
    
}

exports.GetAdvertisement = async (req,res) =>{
    try {
        const advertisement = await Advertisement.findAll({ include: User });
        res.status(200).json(advertisement);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
}