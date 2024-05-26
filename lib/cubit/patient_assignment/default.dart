import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/data/model/model.dart';

List<PatientAssignment> defaultAssignments = [
  PatientAssignment(
    id: 1,
    title: 'Anxiety Worksheet',
    subtitle:
        '“Thoughts are like a running dialogue in your brain. They come and go fast and we rarely have enough time to question them."',
    author: 'Karina Saraswati',
    authorHonorific: 'Dr.',
    notes: 'Please complete this assignment before our upcoming session.',
    type: AssignmentType.Socratic_Questions,
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
        modelAnswer: 'Am I deserved to stay in my job?',
      ),
      PatientWorksheet(
        page: 1,
        title: 'What is the evidence for this thought?',
        hint: 'Tell what you have found...',
        modelAnswer:
            'I feel that my education background doesn’t fit with my current job, so many targets that I haven’t achieve yet.',
      ),
      PatientWorksheet(
        page: 1,
        title: 'Am I basing this thought on facts, or on feelings?',
        hint: 'Tell what you have found...',
        modelAnswer: 'It’s currently 50:50 between facts or feelings.',
      ),
      PatientWorksheet(
        page: 1,
        title: 'Is this reality more complicated than the thought?',
        hint: 'Tell what you have found...',
        modelAnswer: 'Much more complicated.',
      ),
      PatientWorksheet(
        page: 2,
        title: 'Could you be misinterpreting the evidence?',
        hint: 'Write your assumptions...',
        modelAnswer: 'Probably, it seems normal in my work environment.',
      ),
      PatientWorksheet(
        page: 2,
        title: 'Might other people have different interpretations?',
        hint: 'Write your assumptions...',
        modelAnswer:
            'Possibly yes. Their role are far more higher/senior than my own, and they are probably have different views regarded to my work right now.',
      ),
      PatientWorksheet(
        page: 2,
        title: 'Am I looking at all the evidence?',
        subtitle:
            "This section is to make sure that you are sure with the evidence, and not just what supports your thought.",
        hint: 'Tell what you have found...',
        modelAnswer:
            'I don’t think I already seen all the evidences, and other perspective too. I feel that for now, I only accepted views that are similar to what I thoughts.',
      ),
      PatientWorksheet(
        page: 3,
        title: 'Could my thought be an exaggeration?',
        hint: 'Tell what you have found...',
        modelAnswer: 'Maybe',
      ),
      PatientWorksheet(
        page: 3,
        title: 'Am I having this thought our of habit?',
        subtitle: "You can tell what thoughts or which facts that support it.",
        hint: 'Tell what you have found...',
        modelAnswer:
            'I used to overthink a lot. But at some point, I can see and accept the facts that supports my thought.',
      ),
      PatientWorksheet(
        page: 3,
        title: 'Did someone pass this thought? Are they reliable?',
        hint: 'Tell what you have found...',
        modelAnswer:
            'Salah satu management pernah berkata kepadaku bahwa dia merasa cukup puas dengan hasil kerjaku akhir-akhir ini meskipun memang belum 100% tercapai. One of my boss said they I can work more on my job, especially what I did recently, even if it’s not a total 100% improvements',
      ),
      PatientWorksheet(
        page: 4,
        title:
            'Is my thought a likely scenario?  Or is it the worst-case scenario?',
        hint: 'Re-confirming your thoughts again...',
        modelAnswer:
            'My thoughts are usually went to the worst-case possible scenario, and it could happen if I don’t do my job as good as possible.',
      ),
    ],
    createdAt: DateTime.now(),
  ),
  PatientAssignment(
    id: 2,
    title: 'Anxiety Worksheet',
    subtitle:
        '<span style="font-weight: 400;"><b style="font-weight: 900;">Facts</b> are verifiable statements.<br/><b>Opinions</b> are personal interpretations of facts, which differ from person to person.<br/><br/>For example, it is a fact that the sky is blue, and an opinion that the weather is beautiful.</span>',
    author: 'Karina Saraswati',
    authorHonorific: 'Dr.',
    notes: 'Please complete this assignment before our upcoming session.',
    type: AssignmentType.Facts_or_Opinion,
    preparations: [
      'Read each of statements and identify if they are <b>fact</b> or <b>opinion</b>.',
      'With practice, you can get better at spotting the difference between fact and opinion',
    ],
    totalPages: 5,
    duration: 30,
    worksheets: [
      PatientWorksheet(
        page: 0,
        title: 'I listened to my friend talk about their bad day.',
      ),
      PatientWorksheet(
        page: 1,
        title: 'I am a good friend.',
      ),
      PatientWorksheet(
        page: 2,
        title: 'I am ugly.',
      ),
      PatientWorksheet(
        page: 3,
        title: 'I have a blemish on my face.',
      ),
      PatientWorksheet(
        page: 4,
        title: 'My hair looks bad.',
      ),
      PatientWorksheet(
        page: 5,
        title: 'My boss said that I did a great job on the project.',
      ),
      PatientWorksheet(
        page: 6,
        title: 'No one will ever like me.',
      ),
      PatientWorksheet(
        page: 7,
        title: 'My crush said "no" when I asked them out.',
      ),
      PatientWorksheet(
        page: 8,
        title: "I'm not as smart as the rest of my class.",
        subtitle: "You can tell what thoughts or which facts that support it.",
        hint: 'Tell what you have found...',
      ),
      PatientWorksheet(
        page: 9,
        title: "I'm lazy.",
      ),
      PatientWorksheet(
        page: 10,
        title: 'I watched TV instead of doing my homework.',
      ),
      PatientWorksheet(
        page: 11,
        title:
            'My friend is angry at me. I know this because they were frowning.',
      ),
      PatientWorksheet(
        page: 12,
        title: 'My friend frowned.',
      ),
      PatientWorksheet(
        page: 13,
        title: 'Everyone was bored during my speech.',
      ),
      PatientWorksheet(
        page: 14,
        title: 'I should always be nice',
      ),
    ],
    createdAt: DateTime.now(),
  ),
];
