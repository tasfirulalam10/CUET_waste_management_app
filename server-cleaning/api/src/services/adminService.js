const Admin = require('../models/adminModel');

async function createAdmin(userId) {
  return Admin.create({ userId });
}

async function findAdminByUserId(userId) {
  return Admin.findOne({ userId });
}

module.exports = {
  createAdmin,
  findAdminByUserId,
};
