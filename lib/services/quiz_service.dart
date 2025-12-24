class QuizOption {
  final String text;
  final bool isCorrect;

  QuizOption({required this.text, this.isCorrect = false});
}

class QuizQuestion {
  final String id;
  final String questionText;
  final List<QuizOption> options;

  QuizQuestion({
    required this.id,
    required this.questionText,
    required this.options,
  });
}

class QuizService {
  static final List<QuizQuestion> mockQuestions = [
    QuizQuestion(
      id: '1',
      questionText: 'Manakah dari berikut ini yang bukan merupakan bahasa pemrograman backend populer?',
      options: [
        QuizOption(text: 'Python'),
        QuizOption(text: 'Java'),
        QuizOption(text: 'HTML', isCorrect: true),
        QuizOption(text: 'PHP'),
      ],
    ),
    QuizQuestion(
      id: '2',
      questionText: 'Apa fungsi utama dari CSS dalam pengembangan web?',
      options: [
        QuizOption(text: 'Mengatur logika server'),
        QuizOption(text: 'Mengatur tampilan dan gaya visual', isCorrect: true),
        QuizOption(text: 'Mengelola database'),
        QuizOption(text: 'Menghubungkan ke API'),
      ],
    ),
    QuizQuestion(
      id: '3',
      questionText: 'Siapa penemu bahasa pemrograman Python?',
      options: [
        QuizOption(text: 'Guido van Rossum', isCorrect: true),
        QuizOption(text: 'James Gosling'),
        QuizOption(text: 'Brendan Eich'),
        QuizOption(text: 'Linus Torvalds'),
      ],
    ),
  ];
}
