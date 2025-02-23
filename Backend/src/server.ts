import app from './app';
import dotenv from 'dotenv';

dotenv.config();

const PORT: number = Number(process.env.PORT) || 5000; // Ensure PORT is a number
const HOST: string = '0.0.0.0'; // Allows access from other devices on the network

app.listen(PORT, HOST, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
