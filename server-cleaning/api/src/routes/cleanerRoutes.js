// routes/cleanerRoutes.js
const express = require('express');
const router = express.Router();
const Cleaner = require('../models/cleanerModel');

// Fetch all cleaners
router.get('/cleaners', async (req, res) => {
  try {
    const cleaners = await Cleaner.find();
    res.json(cleaners);
  } catch (error) {
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Add a cleaner
router.post('/cleaners', async (req, res) => {
  const { name } = req.body;

  try {
    const newCleaner = new Cleaner({ name });
    await newCleaner.save();
    res.sendStatus(200);
  } catch (error) {
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Assign a task/place to a cleaner
router.put('/cleaners/:id/assign', async (req, res) => {
  const cleanerId = req.params.id;
  const { assignedPlace } = req.body;

  try {
    await Cleaner.findByIdAndUpdate(cleanerId, { assignedPlace });
    res.sendStatus(200);
  } catch (error) {
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Remove a cleaner
router.delete('/cleaners/:id', async (req, res) => {
  const cleanerId = req.params.id;

  try {
    await Cleaner.findByIdAndRemove(cleanerId);
    res.sendStatus(200);
  } catch (error) {
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
