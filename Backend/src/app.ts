import express from 'express';
import cors from 'cors';
import studentRoutes from './routes/studentRoutes';
import connectDB from './config/db';

const app = express();
app.use(cors());
app.use(express.json());

// Connect to MongoDB
connectDB();

app.use('/students', studentRoutes);

export default app;
