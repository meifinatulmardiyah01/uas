import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tugas_uas/services/quiz_service.dart';
import 'package:tugas_uas/quiz_result_page.dart';

class QuizPage extends StatefulWidget {
  final String quizTitle;
  const QuizPage({super.key, this.quizTitle = "Dasar Pemrograman"});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  Map<int, int?> _selectedAnswers = {};
  late Timer _timer;
  int _secondsRemaining = 10 * 60; // 10 minutes
  bool _isFinished = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer.cancel();
        _finishQuiz();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _finishQuiz() {
    _timer.cancel();
    
    int score = _calculateScore();
    int totalQuestions = QuizService.mockQuestions.length;
    int correctCount = 0;
    QuizService.mockQuestions.asMap().forEach((index, question) {
      if (_selectedAnswers[index] != null && question.options[_selectedAnswers[index]!].isCorrect) {
        correctCount++;
      }
    });
    int wrongCount = totalQuestions - correctCount;
    String timeTaken = _formatTime(10 * 60 - _secondsRemaining);

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultPage(
            score: score,
            correctCount: correctCount,
            wrongCount: wrongCount,
            timeTaken: timeTaken,
            selectedAnswers: _selectedAnswers,
          ),
        ),
      );
    }
  }

  int _calculateScore() {
    int score = 0;
    final questions = QuizService.mockQuestions;
    _selectedAnswers.forEach((qIndex, oIndex) {
      if (oIndex != null && questions[qIndex].options[oIndex].isCorrect) {
        score++;
      }
    });
    return (score / questions.length * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF135BEC);
    const backgroundDark = Color(0xFF101622);
    const surfaceDark = Color(0xFF1A2230);
    const textWhite = Colors.white;
    const textGrey = Color(0xFF94A3B8);

    final questions = QuizService.mockQuestions;
    final currentQuestion = questions[_currentIndex];
    final progress = (_currentIndex + 1) / questions.length;

    return Scaffold(
      backgroundColor: backgroundDark,
      appBar: AppBar(
        backgroundColor: backgroundDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: textGrey),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'KUIS: ${widget.quizTitle.toUpperCase()}',
          style: const TextStyle(
            color: textGrey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.timer_outlined, color: Colors.redAccent, size: 16),
                const SizedBox(width: 6),
                Text(
                  _formatTime(_secondsRemaining),
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courier',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Progress',
                      style: TextStyle(color: textGrey, fontSize: 12),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(
                        color: primaryBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: surfaceDark,
                    color: primaryBlue,
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: primaryBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Pertanyaan ${_currentIndex + 1} / ${questions.length}',
                      style: const TextStyle(
                        color: primaryBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    currentQuestion.questionText,
                    style: const TextStyle(
                      color: textWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ...List.generate(currentQuestion.options.length, (index) {
                    final option = currentQuestion.options[index];
                    final isSelected = _selectedAnswers[_currentIndex] == index;

                    return _buildOptionCard(
                      option.text,
                      index,
                      isSelected,
                      primaryBlue,
                      surfaceDark,
                      textWhite,
                    );
                  }),
                ],
              ),
            ),
          ),

          // Bottom Bar
          Container(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            decoration: BoxDecoration(
              color: backgroundDark,
              border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05))),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _currentIndex > 0
                        ? () => setState(() => _currentIndex--)
                        : null,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: textGrey,
                      side: BorderSide(color: Colors.white.withOpacity(0.1)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('Sebelumnya'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentIndex < questions.length - 1) {
                        setState(() => _currentIndex++);
                      } else {
                        _finishQuiz();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 8,
                      shadowColor: primaryBlue.withOpacity(0.4),
                    ),
                    child: Text(
                        _currentIndex < questions.length - 1 ? 'Lanjut' : 'Selesai'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(String text, int index, bool isSelected, Color primary,
      Color surface, Color textWhite) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isSelected ? primary.withOpacity(0.08) : surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? primary : Colors.white.withOpacity(0.05),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            setState(() {
              _selectedAnswers[_currentIndex] = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: isSelected ? primary : textWhite,
                      fontSize: 16,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? primary : Colors.white.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultView(Color primary, Color bg, Color surface, Color textWhite, Color textGrey) {
    int score = _calculateScore();
    bool isPassed = score >= 70;

    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: isPassed ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isPassed ? Icons.emoji_events : Icons.error_outline,
                  color: isPassed ? Colors.green : Colors.red,
                  size: 64,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                isPassed ? 'Selamat!' : 'Jangan Menyerah!',
                style: TextStyle(
                  color: textWhite,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isPassed ? 'Anda berhasil menyelesaikan kuis.' : 'Anda bisa mencoba kuis ini lagi nanti.',
                textAlign: TextAlign.center,
                style: TextStyle(color: textGrey, fontSize: 16),
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    const Text(
                      'SKOR ANDA',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '$score%',
                      style: TextStyle(
                        color: isPassed ? Colors.green : Colors.red,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Kembali ke Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
