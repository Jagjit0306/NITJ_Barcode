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

    res.status(200).json(student ? student : { message: 'Student not found' });

  } catch (error) {
    res.status(500).json({ error: 'Internal Server Error' });
  }
};
