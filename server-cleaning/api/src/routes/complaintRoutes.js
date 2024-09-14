const express = require('express');
const complaintController = require('../controllers/complaintController');

const router = express.Router();

router.post('/submit', complaintController.submitComplaint);

module.exports = router;
