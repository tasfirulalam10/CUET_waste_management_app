const User = require('../models/userModel');

async function createUser(username, email, password, role) {
  return User.create({ username, email, password, role });
}

async function findUserByUsername(email) {
  return User.findOne({ email });
}

// New function to fetch cleaners
async function getusers() {
  return User.find({ role: 'cleaner' });
}

module.exports = {
  createUser,
  findUserByUsername,
  getusers, // Add the new function here
};
