const complaintService = require('../services/complaintService');

async function submitComplaint(req, res) {
  const { location, comment } = req.body;

  try {
    const complaint = await complaintService.createComplaint(location, comment);
    res.status(201).json(complaint);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

module.exports = {
  submitComplaint,
};
