import 'package:lightenup/cubit/patient_assignment/default.dart';
import 'package:lightenup/data/model/model.dart';

List<Patient> defaultPatients = [
  Patient(
    id: 1,
    name: 'Adelia Junianti',
    diagnosis: 'Anxiety',
    profilePicture: 'assets/images/photo-1515077678510-ce3bdf418862.jpeg',
    assignmentAnswers: [],
    assignments: [defaultAssignments[0]],
    moods: [
      PatientMood(
        id: -1,
        emoji: '🙂',
        moodValue: 0,
        colorHex: '#004895',
        backgroundHexStart: '#80DEF8',
        backgroundHexEnd: '#80F8CA',
        mood: 'happy',
        moodText: 'Happy!',
        notes:
            'I am feeling great today! I had a good day at work and I am excited for the weekend!',
        reasons: ['Social', 'Work', 'Family', 'Health'],
        date: DateTime.now(),
      ),
    ],
  ),
  Patient(
    id: 2,
    name: 'Lidya Chairunnisa',
    diagnosis: 'Anxiety',
    profilePicture: 'assets/images/photo-1580489944761-15a19d654956.jpeg',
    assignmentAnswers: [],
    assignments: [],
    moods: [
      PatientMood(
        id: -1,
        emoji: '😊',
        moodValue: 1,
        colorHex: '#FFFFFF',
        backgroundHexStart: '#B280F8',
        backgroundHexEnd: '#D680F8',
        mood: 'surprised',
        moodText: 'Surprised',
        notes:
            'In the morning, I received a surprise gift from my friend. It made my day!',
        reasons: ['Food', 'School', 'Work', 'Family', 'Health'],
        date: DateTime.now(),
      ),
    ],
  ),
  Patient(
    id: 3,
    name: 'Dinda Tamara',
    diagnosis: 'Sleeping disorder',
    profilePicture: 'assets/images/photo-1438761681033-6461ffad8d80.jpeg',
    assignmentAnswers: [],
    assignments: [],
    moods: [
      PatientMood(
        id: -1,
        emoji: '😡',
        moodValue: 5,
        colorHex: '#FFFFFF',
        backgroundHexStart: '#F8808A',
        backgroundHexEnd: '#F89A80',
        mood: 'angry',
        moodText: 'Angry',
        notes:
            'There were some arguments at work today. I am feeling angry and frustrated. I need to calm down.',
        reasons: ['Work'],
        date: DateTime.now(),
      ),
    ],
  ),
];
