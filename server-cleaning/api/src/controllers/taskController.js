const taskService = require('../services/taskService');

async function assignTask(req, res) {
  const { title, description, assignedTo } = req.body;

  try {
    const task = await taskService.createTask(title, description, assignedTo);
    res.status(201).json(task);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

module.exports = {
  assignTask,
};
