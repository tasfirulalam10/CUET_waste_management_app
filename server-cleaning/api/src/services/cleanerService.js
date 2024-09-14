const Cleaner = require('../models/cleanerModel');

async function createCleaner(userId) {
  return Cleaner.create({ userId });
}

async function findCleanerByUserId(userId) {
  return Cleaner.findOne({ userId });
}

module.exports = {
  createCleaner,
  findCleanerByUserId,
};
