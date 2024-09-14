// models/cleaner.js
const mongoose = require('mongoose');

const cleanerSchema = new mongoose.Schema({
  name: { type: String, required: true },
  assignedPlace: { type: String, default: '' },
});

const Cleaner = mongoose.model('Cleaner', cleanerSchema);

module.exports = Cleaner;
