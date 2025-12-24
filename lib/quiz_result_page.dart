import 'package:flutter/material.dart';
import 'package:tugas_uas/services/quiz_service.dart';

class QuizResultPage extends StatelessWidget {
  final int score;
  final int correctCount;
  final int wrongCount;
  final String timeTaken;
  final Map<int, int?> selectedAnswers;

  const QuizResultPage({
    super.key,
    required this.score,
    required this.correctCount,
    required this.wrongCount,
    required this.timeTaken,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF135BEC);
    const backgroundDark = Color(0xFF101622);
    const surfaceDark = Color(0xFF1C212E);
    const textWhite = Colors.white;
    const textGrey = Color(0xFF94A3B8);
    const successGreen = Color(0xFF22C55E);
    const errorRed = Color(0xFFEF4444);

    return Scaffold(
      backgroundColor: backgroundDark,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.close, color: textWhite),
                        style: IconButton.styleFrom(
                          backgroundColor: surfaceDark,
                          shape: const CircleBorder(),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Hasil Kuis',
                            style: TextStyle(
                              color: textWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48), // Balancing for the close button
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Hero Score Card
                        _buildHeroScoreCard(primaryBlue, surfaceDark, textWhite, textGrey, score),

                        const SizedBox(height: 24),

                        // Stats Grid
                        _buildStatsGrid(correctCount, wrongCount, timeTaken, textWhite, textGrey, successGreen, errorRed, surfaceDark, primaryBlue),

                        const SizedBox(height: 32),

                        // Review Section Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tinjauan Jawaban',
                              style: TextStyle(
                                color: textWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Lihat Semua',
                                style: TextStyle(color: primaryBlue, fontSize: 14),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // Review List
                        ...QuizService.mockQuestions.asMap().entries.map((entry) {
                          int index = entry.key;
                          QuizQuestion question = entry.value;
                          int? userAnswerIndex = selectedAnswers[index];
                          bool isCorrect = userAnswerIndex != null && question.options[userAnswerIndex].isCorrect;

                          return _buildReviewAccordion(
                            index + 1,
                            question,
                            userAnswerIndex,
                            isCorrect,
                            surfaceDark,
                            textWhite,
                            textGrey,
                            successGreen,
                            errorRed,
                            backgroundDark,
                          );
                        }).toList(),

                        const SizedBox(height: 24),

                        // Promotion / Next Step Card
                        _buildNextStepCard(primaryBlue, surfaceDark, textWhite, textGrey, backgroundDark),

                        const SizedBox(height: 100), // Space for bottom bar
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
              decoration: BoxDecoration(
                color: surfaceDark.withOpacity(0.95),
                border: const Border(top: BorderSide(color: Colors.white10)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.replay, size: 20),
                      label: const Text('Ulangi'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.05),
                        foregroundColor: textWhite,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 8,
                        shadowColor: primaryBlue.withOpacity(0.4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Lanjut Materi'),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, size: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroScoreCard(Color primary, Color surface, Color textWhite, Color textGrey, int score) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: score / 100,
                  strokeWidth: 8,
                  backgroundColor: primary.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(primary),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$score',
                    style: TextStyle(
                      color: textWhite,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Poin',
                    style: TextStyle(
                      color: textGrey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            score >= 75 ? 'Luar Biasa!' : 'Terus Berusaha!',
            style: TextStyle(
              color: textWhite,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(color: textGrey, fontSize: 14, height: 1.5),
              children: [
                const TextSpan(text: 'Kamu telah menyelesaikan modul '),
                TextSpan(
                  text: 'Dasar Pemrograman',
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' dengan sangat baik.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(int correct, int wrong, String time, Color textWhite, Color textGrey, Color success, Color error, Color surface, Color primary) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          _buildStatItem('Benar', correct.toString(), Icons.check_circle, success, textWhite, textGrey),
          Container(height: 40, width: 1, color: Colors.white10),
          _buildStatItem('Salah', wrong.toString(), Icons.cancel, error, textWhite, textGrey),
          Container(height: 40, width: 1, color: Colors.white10),
          _buildStatItem('Waktu', time, Icons.timer, primary, textWhite, textGrey),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon, Color iconColor, Color textWhite, Color textGrey) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: textWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: textGrey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewAccordion(
    int number,
    QuizQuestion question,
    int? userAnswerIndex,
    bool isCorrect,
    Color surface,
    Color textWhite,
    Color textGrey,
    Color success,
    Color error,
    Color bg,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Theme(
        data: ThemeData.dark().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(side: BorderSide.none),
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: (isCorrect ? success : error).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isCorrect ? Icons.check : Icons.close,
              color: isCorrect ? success : error,
              size: 16,
            ),
          ),
          title: Text(
            '$number. ${question.questionText}',
            style: TextStyle(
              color: textWhite,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            userAnswerIndex != null
                ? 'Jawaban kamu: ${question.options[userAnswerIndex].text}'
                : 'Tidak dijawab',
            style: TextStyle(
              color: isCorrect ? textGrey : error.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(60, 0, 16, 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: (isCorrect ? success : error).withOpacity(0.1)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!isCorrect) ...[
                      Row(
                        children: [
                          const Text(
                            'Jawaban Benar: ',
                            style: TextStyle(color: Colors.white54, fontSize: 11),
                          ),
                          Text(
                            question.options.firstWhere((o) => o.isCorrect).text,
                            style: TextStyle(
                              color: success,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                    const Text(
                      'Penjelasan:',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      question.explanation,
                      style: TextStyle(
                        color: textGrey,
                        fontSize: 11,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextStepCard(Color primary, Color surface, Color textWhite, Color textGrey, Color backgroundDark) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              image: DecorationImage(
                image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCQG-AP-Y2D579MxX0N832aVea0MFKrzHnpvHPSyCfrHaaW164ky9_CcEcHKItSjQEjqXtnDF0rrRo14XGBApwM4JqDEvZWUDYM4lRqVsUW9RBrYPaRHOYE9cZBwTTNjUsNHDYZGp9lJVd-7ONXmrIP0RhmbioIYGj19UV22P4rf6TP55tNSJbE3r2yGRR14EqpFri_iaeJrZ-1mezIwoJfdJ9SqNf5x7HjvK6qjyRAcXPq97mUJF-GV5mpPDMmp-fKgdxpLRbg7JFI'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, surface],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: backgroundDark,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'MODUL SELANJUTNYA',
                      style: TextStyle(
                        color: primary,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pergerakan Nasional',
                  style: TextStyle(
                    color: textWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Pelajari organisasi-organisasi awal yang membentuk semangat kebangsaan sebelum kemerdekaan.',
                  style: TextStyle(color: textGrey, fontSize: 12, height: 1.4),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.library_books, color: textGrey, size: 14),
                    const SizedBox(width: 4),
                    Text('4 Bab', style: TextStyle(color: textGrey, fontSize: 11)),
                    const SizedBox(width: 16),
                    Icon(Icons.schedule, color: textGrey, size: 14),
                    const SizedBox(width: 4),
                    Text('45 Min', style: TextStyle(color: textGrey, fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
