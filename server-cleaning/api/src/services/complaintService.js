const Complaint = require('../models/complaintModel');

async function createComplaint(location, comment) {
  return Complaint.create({ location, comment });
}

async function findComplaintById(complaintId) {
  return Complaint.findById(complaintId);
}

module.exports = {
  createComplaint,
  findComplaintById,
};
