import { Request, Response } from 'express';
import Student from '../models/studentModel';

export const getStudent = async (req: Request, res: Response): Promise<void> => {
  try {
    const rollNo = parseInt(req.params.rollNo, 10);
    if (isNaN(rollNo)) {
      res.status(400).json({ error: 'Invalid roll number' });
      return;
    }

    const student = await Student.findOne({ rollNo });
    if (!student) {
      res.status(404).json({ error: 'Student not found' });
      return;
    }

    res.json(student);
  } catch (error) {
    res.status(500).json({ error: 'Internal Server Error' });
  }
};
