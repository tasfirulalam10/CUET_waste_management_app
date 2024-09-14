const mongoose = require('mongoose');

const complaintSchema = new mongoose.Schema({
  location: { type: String, required: true },
  comment: { type: String, required: true },
  status: { type: String, default: 'open' },
}, { timestamps: true });

const Complaint = mongoose.model('Complaint', complaintSchema);

module.exports = Complaint;
