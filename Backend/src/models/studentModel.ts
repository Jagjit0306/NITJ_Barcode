import mongoose from 'mongoose';

const StudentSchema = new mongoose.Schema({
  rollNo: { type: Number, required: true, unique: true },
  name: { type: String, required: true },
  branch: { type: String, required: true },
});

const Student = mongoose.model('Student', StudentSchema);

export default Student;
