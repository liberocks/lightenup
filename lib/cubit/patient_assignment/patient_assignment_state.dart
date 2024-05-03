import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lightenup/data/model/model.dart';

part 'patient_assignment_state.freezed.dart';

List<PatientAssignment> demoAssignments = [
  PatientAssignment(
    id: 1,
    title: 'Socratic Questions',
    subtitle:
        '“Thoughts are like a running dialogue in your brain. They come and go fast and we rarely have enough time to question them."',
    author: 'Karina Saraswati',
    preparations: [
      'Spend a moment thinking about each of the following questions.',
      'Record thorough responses carefully.',
      'Elaborate, and explain “why” or “why not” in your response',
    ],
    totalPages: 5,
    duration: 30,
    worksheets: [
      PatientWorksheet(
        page: 0,
        title: 'Thoughts to be questioned:',
        subtitle: 'You can write anythings that comes on your mind.',
        hint: 'Write your thoughts here...',
      ),
      PatientWorksheet(
        page: 1,
        title: 'What is the evidence for this thought?',
        hint: 'Tell what you have found...',
      ),
      PatientWorksheet(
        page: 1,
        title: 'Am I basing this thought on facts, or on feelings?',
        hint: 'Tell what you have found...',
      ),
      PatientWorksheet(
        page: 1,
        title: 'Is this reality more complicated than the thought?',
        hint: 'Tell what you have found...',
      ),
      PatientWorksheet(
        page: 2,
        title: 'Could you be misinterpreting the evidence?',
        hint: 'Write your assumptions...',
      ),
      PatientWorksheet(
        page: 2,
        title: 'Might other people have different interpretations?',
        hint: 'Write your assumptions...',
      ),
      PatientWorksheet(
        page: 2,
        title: 'Am I looking at all the evidence?',
        hint: 'Tell what you have found...',
      ),
      PatientWorksheet(
        page: 3,
        title: 'Could my thought be an exaggeration?',
        hint: 'Tell what you have found...',
      ),
      PatientWorksheet(
        page: 3,
        title: 'Am I having this thought our of habit?',
        hint: 'Tell what you have found...',
      ),
      PatientWorksheet(
        page: 3,
        title: 'Did someone pass this thought? Are they reliable?',
        hint: 'Tell what you have found...',
      ),
      PatientWorksheet(
        page: 4,
        title:
            'Is my thought a likely scenario?  Or is it the worst-case scenario?',
        hint: 'Re-confirming your thoughts again...',
      ),
    ],
    createdAt: DateTime.now(),
  ),
];

@freezed
class PatientAssignmentState with _$PatientAssignmentState {
  const factory PatientAssignmentState.initial({
    @Default([]) List<PatientAssignment> assignments,
    @Default([]) List<PatientAssignmentAnswer> assignmentAnswers,
  }) = _Initial;

  factory PatientAssignmentState.fromJson(Map<String, dynamic> json) {
    return PatientAssignmentState.initial(
      assignments: (json['assignments'] as List)
          .map((e) => PatientAssignment.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignmentAnswers: (json['assignmentAnswers'] as List)
          .map(
            (e) => PatientAssignmentAnswer.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
