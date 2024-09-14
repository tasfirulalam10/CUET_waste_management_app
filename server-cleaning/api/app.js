const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const cors = require('cors');


const userRoutes = require('./src/routes/userRoutes');
const cleanerRoutes = require('./src/routes/cleanerRoutes');
const adminRoutes = require('./src/routes/adminRoutes');
const taskRoutes = require('./src/routes/taskRoutes');
const complaintRoutes = require('./src/routes/complaintRoutes');

const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use(cors());
mongoose.connect('mongodb://localhost:27017/waste-management', { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((error) => {
    console.error('Error connecting to MongoDB:', error.message);
  });

app.use('/users', userRoutes);
app.use('/cleaners', cleanerRoutes);
app.use('/admins', adminRoutes);
app.use('/tasks', taskRoutes);
app.use('/complaints', complaintRoutes);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

app.on('error', (error) => {
  console.error('Server error:', error.message);
});
app.post('/users/register', async (req, res) => {
  try {
    // Your registration logic here
    // If successful, send a response with status 200
    res.status(200).json({ message: 'Registration successful' });
  } catch (error) {
    // Log the error and send an error response
    console.error('Error during registration:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});
