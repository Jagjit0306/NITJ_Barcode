import express from 'express';
import cors from 'cors';
import studentRoutes from './routes/studentRoutes';
import connectDB from './config/db';

const app = express();

// Enable CORS for all origins
app.use(cors({
  origin: '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));

app.use(express.json());

// Connect to MongoDB
connectDB();

app.use('/students', studentRoutes);

export default app;
