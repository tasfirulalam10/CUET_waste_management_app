const userService = require('../services/userService');

async function registerUser(req, res) {
  const { username, email, password, role } = req.body;

  try {
    const user = await userService.createUser(username, email, password, role);
    res.status(201).json(user);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

async function loginUser(req, res) {
  const { email, password } = req.body;

  try {
    const user = await userService.findUserByUsername(email);

    if (user && user.password === password) {
      res.status(200).json({ message: 'Login successful', user });
    } else {
      res.status(401).json({ message: 'Invalid credentials' });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

// New function to fetch cleaners
async function getusers(req, res) {
  try {
    const users = await userService.getusers();
    res.status(200).json(users);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

module.exports = {
  registerUser,
  loginUser,
  getusers, // Add the new function here
};
