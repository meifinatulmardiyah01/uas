import 'package:flutter/material.dart';

class CourseLesson {
  final String id;
  final String title;
  final String type; // 'Video', 'PDF', 'Quiz'
  final String duration;
  final bool isLocked;
  final bool isCompleted;

  CourseLesson({
    required this.id,
    required this.title,
    required this.type,
    required this.duration,
    this.isLocked = false,
    this.isCompleted = false,
  });
}

class CourseModule {
  final String title;
  final List<CourseLesson> lessons;
  final bool isOpen;

  CourseModule({
    required this.title,
    required this.lessons,
    this.isOpen = false,
  });
}

class CourseService {
  static final List<CourseModule> mockModules = [
    CourseModule(
      title: 'Pengenalan Desain',
      isOpen: true,
      lessons: [
        CourseLesson(
          id: '1',
          title: 'Apa itu UX Design?',
          type: 'Video',
          duration: '12:05',
          isCompleted: true,
        ),
        CourseLesson(
          id: '2',
          title: 'Sejarah Desain Antarmuka',
          type: 'PDF',
          duration: '2.4 MB',
        ),
        CourseLesson(
          id: '3',
          title: 'Kuis Pengetahuan Dasar',
          type: 'Quiz',
          duration: '10 Soal',
        ),
      ],
    ),
    CourseModule(
      title: 'Color Theory',
      lessons: [
        CourseLesson(
          id: '4',
          title: 'Psikologi Warna',
          type: 'Video',
          duration: '15:30',
          isLocked: true,
        ),
        CourseLesson(
          id: '5',
          title: 'Palet Warna untuk Digital',
          type: 'PDF',
          duration: '1.8 MB',
          isLocked: true,
        ),
      ],
    ),
    CourseModule(
      title: 'Typography',
      lessons: [
        CourseLesson(
          id: '6',
          title: 'Dasar-dasar Tipografi',
          type: 'Video',
          duration: '20:00',
          isLocked: true,
        ),
      ],
    ),
  ];
}
