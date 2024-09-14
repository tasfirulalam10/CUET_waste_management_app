const cleanerService = require('../services/cleanerService');

async function getCleanerTasks(req, res) {
  const { userId } = req.params;

  try {
    const cleaner = await cleanerService.findCleanerByUserId(userId);

    if (cleaner) {
      res.status(200).json(cleaner.assignedTasks);
    } else {
      res.status(404).json({ message: 'Cleaner not found' });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

module.exports = {
  getCleanerTasks,
};
