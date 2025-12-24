class QuizOption {
  final String text;
  final bool isCorrect;

  QuizOption({required this.text, this.isCorrect = false});
}

class QuizQuestion {
  final String id;
  final String questionText;
  final String explanation;
  final List<QuizOption> options;

  QuizQuestion({
    required this.id,
    required this.questionText,
    required this.explanation,
    required this.options,
  });
}

class QuizService {
  static final List<QuizQuestion> mockQuestions = [
    QuizQuestion(
      id: '1',
      questionText: 'Manakah dari berikut ini yang bukan merupakan bahasa pemrograman backend populer?',
      explanation: 'HTML adalah bahasa markup untuk struktur web, bukan bahasa pemrograman backend seperti Python, Java, atau PHP.',
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
      explanation: 'CSS (Cascading Style Sheets) digunakan untuk mengatur tata letak, warna, font, dan keseluruhan tampilan visual halaman web.',
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
      explanation: 'Guido van Rossum menciptakan Python pada akhir 1980-an sebagai penerus bahasa pemrograman ABC.',
      options: [
        QuizOption(text: 'Guido van Rossum', isCorrect: true),
        QuizOption(text: 'James Gosling'),
        QuizOption(text: 'Brendan Eich'),
        QuizOption(text: 'Linus Torvalds'),
      ],
    ),
  ];
}
