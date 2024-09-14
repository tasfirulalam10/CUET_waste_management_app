const adminService = require('../services/adminService');
const complaintService = require('../services/complaintService');

async function getAdminComplaints(req, res) {
  const { userId } = req.params;

  try {
    const admin = await adminService.findAdminByUserId(userId);

    if (admin) {
      const complaints = await complaintService.getAllComplaints();
      res.status(200).json(complaints);
    } else {
      res.status(404).json({ message: 'Admin not found' });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

module.exports = {
  getAdminComplaints,
};
