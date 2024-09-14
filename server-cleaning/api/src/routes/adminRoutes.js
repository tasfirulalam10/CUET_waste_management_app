const express = require('express');
const adminController = require('../controllers/adminController');

const router = express.Router();

router.get('/:userId/complaints', adminController.getAdminComplaints);

module.exports = router;
