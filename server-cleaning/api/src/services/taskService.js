const Task = require('../models/taskModel');

async function createTask(title, description, assignedTo) {
  return Task.create({ title, description, assignedTo });
}

async function findTaskById(taskId) {
  return Task.findById(taskId);
}

module.exports = {
  createTask,
  findTaskById,
};
