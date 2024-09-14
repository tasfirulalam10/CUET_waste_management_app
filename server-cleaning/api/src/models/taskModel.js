const mongoose = require('mongoose');

const taskSchema = new mongoose.Schema({
  title: { type: String, required: true },
  description: { type: String, required: true },
  assignedTo: { type: mongoose.Schema.Types.ObjectId, ref: 'Cleaner' },
  status: { type: String, default: 'pending' },
}, { timestamps: true });

const Task = mongoose.model('Task', taskSchema);

module.exports = Task;
