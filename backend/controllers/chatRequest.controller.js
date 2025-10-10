const { User, ChatRequest } = require("../associations/associations");

exports.makeRequest = async (req, res) => {
  const { senderId, receiverId } = req.body;

  try {
    const sender = await User.findByPk(senderId);
    const receiver = await User.findByPk(receiverId);

    if (!sender || !receiver) {
      return res.status(404).json({ message: "User not found" });
    }

    await sender.addSentRequests(receiver, { through: { status: "pending" } });

    res.status(201).json({ message: "Chat request sent" });
  } catch (error) {
    console.error(error);
    res.status(400).json({ error: error.message });
  }
};

exports.acceptRequest = async (req, res) => {
  const { senderId, receiverId } = req.body;

  try {
    const request = await ChatRequest.findOne({
      where: { senderId, receiverId },
    });

    if (!request) {
      return res.status(404).json({ message: "Request not found" });
    }

    request.status = "accepted";
    await request.save();

    res.json({ message: "Request accepted", request });
  } catch (error) {
    console.error(error);
    res.status(400).json({ error: error.message });
  }
};
