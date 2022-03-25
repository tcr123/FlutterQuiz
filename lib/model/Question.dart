class Question {
  final int id;
  final List<int> answer;
  final bool mutiple;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.mutiple,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter is an open-source UI software development kit created by ______",
    "options": [
      'Apple aaaa aaaaaaaaa aaaa aaaa aaaa',
      'Google',
      'Facebook',
      'Microsoft'
    ],
    "mutiple": true,
    "answer_index": [1, 2, 3],
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "mutiple": false,
    "answer_index": [2],
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "mutiple": false,
    "answer_index": [2],
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "mutiple": false,
    "answer_index": [2],
  },
];
