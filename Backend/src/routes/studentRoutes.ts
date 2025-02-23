import express from 'express';
import { getStudent } from '../controllers/studentController';

const router = express.Router();

router.get('/:rollNo', getStudent);

export default router;
