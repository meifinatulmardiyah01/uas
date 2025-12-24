import 'package:flutter/material.dart';
import 'package:tugas_uas/explore_page.dart'; // Import to use Course model

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Course> _inProgressCourses = [
    Course(
      title: 'Mastering Figma 2024: Dari Nol ke Pro',
      category: 'Desain UI/UX',
      author: 'Sarah Wijaya',
      imageUrl:
          "https://lh3.googleusercontent.com/aida-public/AB6AXuATbdrxukvBrfnKoOvWfpD6skIJMVcynV4vqYg_8fsfDOD3-FYyx-4lqGu1_btGlIk2EyO5SmFkIQb4IJivf97FbZCnEJSgDo2srWAAhE00laMzCxRMs5aH_v9h10pl4K1kf47nQiLQGXyHCtlrl4YJiNAXMJatjuUxJF7QiTOtmDmagjHmzP-qNA7eywS48sjceYSYcTKGgG6Lb0hweyiFR0meqLQ4jZSoGowSobSBN4iL2qgkQgsn_Dy_LZ1HPOtcA-n7CwES1OUi",
      duration: "2j 15m tersisa",
      progress: 0.45,
    ),
    Course(
      title: 'Python untuk Data Science',
      category: 'Pemrograman',
      author: 'Unknown',
      imageUrl:
          "https://lh3.googleusercontent.com/aida-public/AB6AXuAhbu8uRf2fxedhnG3n7fFGV2-sEV8gTFxARKxU1AiO8aG0eovobLJI6kZxNVsTDEg8zQ27QzdL4teFkke-R6mcHcgt7zc8OyGHjcH8MD1eWZYqqcUbzKDCyUWDVMnU6V2kBXwu2-QqqKZzxlswl3Dlgf-_wbe9pwccMbKcs4Lbi2a6svXPR8RivXJlnoArO-tAf9N3OyHORdIGjD1G0TNxOgOhz-Z-n83oo_IUgFkVash8ZHYtvL7wm-PI2aQVclM_tnNdFTnXo-oE",
      progress: 0.20,
    ),
  ];

  final List<Course> _completedCourses = [
    Course(
      title: 'Dasar Pemrograman Web',
      category: 'Pemrograman',
      author: 'Budi Santoso',
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDikc88QwaATcvPUi2QW4yPikzrO0g-sJO6wALo4eKXGSlkbTFCTBI5u80kjyQ8rY-2-eKoKL2VJc6qtmWk0ib5-CW1pyWCaXZLnHsRUsfC5dLtz_kB5KpeWKKL_7qo3rq61m1lGZPK920enTSv6CUcH_QIXvlATHXMIPy86LAga7YY-O3M4gvNUb13yM4Ts6SgqLz-FzZpsfektmu6ivWOfCjjeJuOL1c2_V2z69C0Pt6-FB0bx_kTIgQRSuyeqFfsFqU9SbA9kEwd",
      progress: 1.0,
      rating: 5.0,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF135BEC);
    final backgroundColor = const Color(0xFFF6F6F8);
    final textMainColor = const Color(0xFF111318);
    final textMutedColor = const Color(0xFF64748B);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Kursusku',
          style: TextStyle(
            color: textMainColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: primaryColor,
          unselectedLabelColor: textMutedColor,
          indicatorColor: primaryColor,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: 'Dalam Proses'),
            Tab(text: 'Selesai'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCourseList(_inProgressCourses, primaryColor, textMainColor, textMutedColor),
          _buildCourseList(_completedCourses, primaryColor, textMainColor, textMutedColor, isCompleted: true),
        ],
      ),
    );
  }

  Widget _buildCourseList(List<Course> courses, Color primaryColor, Color textMainColor, Color textMutedColor, {bool isCompleted = false}) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: courses.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final course = courses[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 2,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(course.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.category,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            course.title,
                            style: TextStyle(
                              color: textMainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          // Additional info if needed
                        ],
                      ),
                    ),
                  ],
                ),
              ),
               // Progress or Certificate Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: isCompleted 
                ? SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.download, size: 16),
                      label: const Text('Unduh Sertifikat'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: primaryColor,
                        side: BorderSide(color: primaryColor),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${(course.progress * 100).toInt()}% Selesai',
                            style: TextStyle(
                              color: textMutedColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Lanjutkan',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: LinearProgressIndicator(
                          value: course.progress,
                          backgroundColor: Colors.grey[100],
                          color: primaryColor,
                          minHeight: 6,
                        ),
                      ),
                    ],
                  ),
              ),
            ],
          ),
        );
      },
    );
  }
}
