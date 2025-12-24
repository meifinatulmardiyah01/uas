import 'package:flutter/material.dart';
import 'package:tugas_uas/services/course_service.dart';

class CourseLearningPage extends StatefulWidget {
  const CourseLearningPage({super.key});

  @override
  State<CourseLearningPage> createState() => _CourseLearningPageState();
}

class _CourseLearningPageState extends State<CourseLearningPage> {
  @override
  Widget build(BuildContext context) {
    const primaryRed = Color(0xFFE53935);
    const backgroundDark = Color(0xFF111318);
    const cardDark = Color(0xFF1C2029);
    const textWhite = Colors.white;
    const textGrey = Color(0xFF94A3B8);

    return Scaffold(
      backgroundColor: backgroundDark,
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            backgroundColor: backgroundDark.withOpacity(0.95),
            elevation: 0,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: textWhite),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Materi Kursus',
              style: TextStyle(
                color: textWhite,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert, color: textWhite),
                onPressed: () {},
              ),
            ],
          ),

          // Main Content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Section
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuBdwCVxH1nTLkxjdIo5J0cKannpy7aBoXPWt0UMWqHniD3a8Qr-kJ3stiPihPoz-puG4EVPLrqq_oQbwxwzfhoUpRp23Am-Uw0ZXXGUN_8XPmI-XWjLOOkl52Z4fj4Qw1pcmpxIPCdRk3WOxSQjNZm1VcApOei2GZO2nUyP1te92p1Ry3gk_Y_Iz1pTxjDdNNRiyKEkVNLOPqqkXX4o4sxtwJ8E45ti4TolqSctpJ1Run7Ux7DCRJZESzQNuBCXkf9mkTlGxaJKgEYP',
                        ),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: primaryRed.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                backgroundDark.withOpacity(0.8),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _buildTag('UI/UX DESIGN', primaryRed),
                                  const SizedBox(width: 8),
                                  _buildTag('INTERMEDIATE', Colors.black45,
                                      border: true),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Dasar Desain UI/UX &\nPrototyping',
                                style: TextStyle(
                                  color: textWhite,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Progress Stats
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'PROGRES ANDA',
                                style: TextStyle(
                                  color: textGrey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Text(
                                    '35%',
                                    style: TextStyle(
                                      color: textWhite,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Selesai',
                                    style: TextStyle(
                                      color: textGrey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          _buildAvatarStack(),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 8,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: cardDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: 0.35,
                          child: Container(
                            decoration: BoxDecoration(
                              color: primaryRed,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: primaryRed,
                                  blurRadius: 10,
                                  spreadRadius: -2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '4 dari 12 Modul selesai',
                        style: TextStyle(color: textGrey, fontSize: 12),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Learning Path
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: CourseService.mockModules.length,
                  itemBuilder: (context, index) {
                    final module = CourseService.mockModules[index];
                    return _buildModuleAccordion(module, index + 1, primaryRed,
                        cardDark, textWhite, textGrey);
                  },
                ),

                const SizedBox(height: 100), // Space for bottom bar
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomActionBar(primaryRed, cardDark),
    );
  }

  Widget _buildTag(String label, Color color, {bool border = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
        border: border ? Border.all(color: Colors.white24) : null,
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildAvatarStack() {
    return SizedBox(
      width: 80,
      height: 32,
      child: Stack(
        children: [
          _buildAvatarCircle('JD', Colors.blueGrey, 0),
          _buildAvatarCircle('AS', Colors.indigo, 20),
          _buildAvatarCircle('+12', const Color(0xFFE53935), 40),
        ],
      ),
    );
  }

  Widget _buildAvatarCircle(String text, Color color, double left) {
    return Positioned(
      left: left,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF111318), width: 2),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildModuleAccordion(CourseModule module, int number, Color primary,
      Color cardColor, Color textWhite, Color textGrey) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: module.isOpen,
          tilePadding: EdgeInsets.zero,
          title: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: module.isOpen
                      ? primary.withOpacity(0.1)
                      : Colors.white.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    number.toString(),
                    style: TextStyle(
                      color: module.isOpen ? primary : textGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                module.title,
                style: TextStyle(
                  color: textWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          trailing: Icon(
            Icons.expand_more,
            color: textGrey,
          ),
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, top: 12),
              padding: const EdgeInsets.only(left: 16),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: Color(0xFF1C2029), width: 2),
                ),
              ),
              child: Column(
                children: module.lessons.map((lesson) {
                  return _buildLessonItem(
                      lesson, primary, cardColor, textWhite, textGrey);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonItem(CourseLesson lesson, Color primary, Color cardColor,
      Color textWhite, Color textGrey) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: lesson.isLocked ? Colors.transparent : cardColor,
        borderRadius: BorderRadius.circular(16),
        border: lesson.isLocked
            ? Border.all(color: Colors.white10)
            : Border.all(color: Colors.transparent),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: lesson.isLocked ? null : () {},
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: lesson.isLocked
                        ? Colors.white10
                        : (lesson.isCompleted ? primary : primary),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    lesson.type == 'Video'
                        ? Icons.play_circle_filled
                        : (lesson.type == 'PDF'
                            ? Icons.description
                            : Icons.quiz),
                    color: lesson.isLocked ? textGrey : Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.title,
                        style: TextStyle(
                          color: lesson.isLocked ? textGrey : textWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              lesson.type,
                              style: TextStyle(color: textGrey, fontSize: 10),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            lesson.duration,
                            style: TextStyle(color: textGrey, fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (lesson.isLocked)
                  Icon(Icons.lock, color: textGrey, size: 18)
                else if (lesson.isCompleted)
                  const Icon(Icons.check_circle, color: Colors.green, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomActionBar(Color primary, Color cardColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF111318),
        border: Border(top: BorderSide(color: Colors.white10)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.download, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  shadowColor: primary.withOpacity(0.5),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow_rounded),
                    SizedBox(width: 8),
                    Text(
                      'Lanjut Belajar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
}
