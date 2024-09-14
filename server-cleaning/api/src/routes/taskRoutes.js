const express = require('express');
const taskController = require('../controllers/taskController');

const router = express.Router();

router.post('/assign', taskController.assignTask);

module.exports = router;
