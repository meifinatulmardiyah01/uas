import 'package:flutter/material.dart';
import 'package:tugas_uas/course_detail_page.dart';

class Course {
  final String title;
  final String category;
  final String author;
  final String imageUrl;
  final String duration; // e.g. "12 Modul", "2j 15m left"
  final double progress; // 0.0 to 1.0
  final double rating;
  final String price; // "Gratis" or value
  final bool isPopular;
  final bool isNew;

  Course({
    required this.title,
    required this.category,
    required this.author,
    required this.imageUrl,
    this.duration = "",
    this.progress = 0.0,
    this.rating = 0.0,
    this.price = "",
    this.isPopular = false,
    this.isNew = false,
  });
}

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'Semua';
  List<Course> _allCourses = [];
  List<Course> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    _initializeCourses();
    _filteredCourses = _allCourses;
    _searchController.addListener(_filterCourses);
  }

  void _initializeCourses() {
    _allCourses = [
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
        title: 'React Native Advanced Patterns',
        category: 'Pemrograman',
        author: 'Budi Santoso',
        imageUrl:
            "https://lh3.googleusercontent.com/aida-public/AB6AXuDikc88QwaATcvPUi2QW4yPikzrO0g-sJO6wALo4eKXGSlkbTFCTBI5u80kjyQ8rY-2-eKoKL2VJc6qtmWk0ib5-CW1pyWCaXZLnHsRUsfC5dLtz_kB5KpeWKKL_7qo3rq61m1lGZPK920enTSv6CUcH_QIXvlATHXMIPy86LAga7YY-O3M4gvNUb13yM4Ts6SgqLz-FzZpsfektmu6ivWOfCjjeJuOL1c2_V2z69C0Pt6-FB0bx_kTIgQRSuyeqFfsFqU9SbA9kEwd",
        rating: 4.8,
        duration: "12 Modul",
        isNew: true,
      ),
      Course(
        title: 'Strategi Digital Marketing 2024',
        category: 'Bisnis',
        author: 'Anita Kusuma',
        imageUrl:
            "https://lh3.googleusercontent.com/aida-public/AB6AXuCPl3g3UFSV82KfUBUUWNqDmI53OD8_FwVIYhpO-72usGkjkJQSytgNPGjz4eMYO6nWgzo7iEojRbhBsNR9xwdn7-F7G2oX9nkvLrZm9vx2E6Nx_60rr5jK2-SZAUK5n2sMSC7ZOV3pzePJGFegg0He6-eax2bxl9J1JeK4I1ySQWGC5wF-I9Fc4HgD-OF7TgXw56dcXEfWTCKlkcM0aAsa8CiiGuPGkqhtQT2ItI3bP86ENIKzmQ_q77Uhg010jyEPboPzDsTQe6mN",
      ),
      Course(
        title: 'Blender 3D untuk Pemula',
        category: 'Desain UI/UX', // Categorized broadly for simplicity or could be new category
        author: 'Doni Pratama',
        imageUrl:
            "https://lh3.googleusercontent.com/aida-public/AB6AXuDpMnxI3Akjcwghrv-GWKuggr3e0EOmLHT0UeIkyleSaDzBRrKHOjdCcpaKwy63RbCEkui_n80GKmLq_UOwPbQoXEgN2TIcLSoQBoXf1O5IQLe4JuSJuVloWpAj3r5guJibf-hhng96_7zNuDc5kASXibABJGinXBJK9VlwjCrY-5Ph5DklAr0kfR91gpHKpEywsKqBhZciOlh2XRv0gmTCa-WTEWHy7HAQjgNL3idjJQ_jEEbfys0WbC0WyguOdhyl1tDrmLDLaOFe",
      ),
      Course(
        title: 'Python untuk Data Science',
        category: 'Pemrograman',
        author: 'Unknown',
        imageUrl:
            "https://lh3.googleusercontent.com/aida-public/AB6AXuAhbu8uRf2fxedhnG3n7fFGV2-sEV8gTFxARKxU1AiO8aG0eovobLJI6kZxNVsTDEg8zQ27QzdL4teFkke-R6mcHcgt7zc8OyGHjcH8MD1eWZYqqcUbzKDCyUWDVMnU6V2kBXwu2-QqqKZzxlswl3Dlgf-_wbe9pwccMbKcs4Lbi2a6svXPR8RivXJlnoArO-tAf9N3OyHORdIGjD1G0TNxOgOhz-Z-n83oo_IUgFkVash8ZHYtvL7wm-PI2aQVclM_tnNdFTnXo-oE",
        progress: 0.20,
      ),
      Course(
        title: 'Digital Marketing 101',
        category: 'Pemasaran',
        author: 'Sarah Wijaya',
        imageUrl:
            "https://lh3.googleusercontent.com/aida-public/AB6AXuD2mWgV60SCFcCyrUzTkkoSbJhiFru65yTsPZmIW_Uy-k0qnBkBBxOMS4ZfbDm4AzPe9zEynVCVbvhONM8_8hv2h2omZt4lyxo53-dhCHrruuPqcanrp5BYsJr1WtyXEiKJjqCqGErEmIs4Omq4jKUDwwmNblte52KhZfQVLgKrHjTuwhS8sofNiQPNW6FOPVIfh2giwEokrjbx4BjoPsvcPYpWZgYp4_0NBc7gRX9Lt0jEqBeU744pa5Z8_uW-N_jbNBRIrGuH8laA",
        rating: 4.8,
        price: "Rp 150.000",
        isPopular: true,
      ),
       Course(
        title: 'Copywriting Masterclass',
        category: 'Pemasaran',
        author: 'Anita Kusuma',
        imageUrl:
            "https://lh3.googleusercontent.com/aida-public/AB6AXuDTOCLDbYZw6jErvRKfmp-H9QcE2_jYoyiv0yW3oCt0Je83glvZZ2mv4KVpV7pYqREIYUt1SC2ydModRp9y0JUKmlHsw00xfRqhGYSJxB4N4-IJ72T3PdUiO8nb41wDmPaedCD1Iacjp86j7KdKlo3vyqHMxk_KAv0RI42RzuIzgCra17TQlCAu6iQ9xz0-NHBrH3GLxt07pibtUeTul0x3OsEiemj6PDYV3sQ6v3NdSNU4gT6kRVb2UG5gsPORZwdOvWbEz8ZQg2Z4",
        rating: 4.9,
        price: "Rp 200.000",
      ),
    ];
  }

  void _filterCourses() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCourses = _allCourses.where((course) {
        final matchesQuery = course.title.toLowerCase().contains(query) ||
            course.author.toLowerCase().contains(query);
        final matchesCategory =
            _selectedCategory == 'Semua' || course.category == _selectedCategory;
        return matchesQuery && matchesCategory;
      }).toList();
    });
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
      _filterCourses();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF135BEC);
    final backgroundColor = const Color(0xFFF6F6F8);
    final surfaceColor = Colors.white;
    final textMainColor = const Color(0xFF0F172A);
    final textMutedColor = const Color(0xFF64748B);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: textMainColor),
                      onPressed: () {
                        // In main screen tab context, back might mean go home or nothing
                        // We will assume it might not be needed in tab view, 
                        // but logic to preserve HTML design:
                      },
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Jelajahi Kursus',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textMainColor,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.filter_list, color: primaryColor),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[400]),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Cari topik, mentor, atau keahlian...',
                          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        style: TextStyle(color: textMainColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  _buildFilterChip('Semua', primaryColor),
                  const SizedBox(width: 8),
                  _buildFilterChip('Desain UI/UX', primaryColor),
                  const SizedBox(width: 8),
                  _buildFilterChip('Pemrograman', primaryColor),
                  const SizedBox(width: 8),
                  _buildFilterChip('Bisnis', primaryColor),
                  const SizedBox(width: 8),
                  _buildFilterChip('Pemasaran', primaryColor),
                ],
              ),
            ),

            // Course List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                itemCount: _filteredCourses.length + 1, // +1 for "Lanjutkan Belajar" title if split, but simplicity here:
                // Actually let's just render the list. 
                // To match specific design groups (Lanjutkan vs Rekomendasi), we might need sectioning.
                // For dynamic search, a flat list is better. Let's stick to flat list of cards.
                separatorBuilder: (ctx, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  if (index == 0) {
                     return Padding(
                       padding: const EdgeInsets.symmetric(vertical: 8),
                       child: Text('Hasil Pencarian', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textMainColor)),
                     );
                  }
                  final course = _filteredCourses[index - 1];
                  return _buildCourseCard(context, course, primaryColor, surfaceColor, textMainColor, textMutedColor);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, Color primaryColor) {
    final isSelected = _selectedCategory == label;
    return GestureDetector(
      onTap: () => _onCategorySelected(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              color: isSelected ? primaryColor : Colors.grey[200]!),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, Course course, Color primaryColor, Color surfaceColor,
      Color textColor, Color mutedColor) {
    // Determine card type based on progress
    if (course.progress > 0) {
      // In Progress Card
      return Container(
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[100]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CourseDetailPage()),
              );
            },
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
                                color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.schedule, size: 14, color: Colors.grey),
                                const SizedBox(width: 4),
                                Text(
                                  course.duration,
                                  style: TextStyle(color: mutedColor, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${(course.progress * 100).toInt()}% Selesai',
                            style: TextStyle(
                              color: mutedColor,
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
          ),
        ),
      );
    } else {
      // Recommendation/Standard Card
      return Container(
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[100]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CourseDetailPage()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                Stack(
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        image: DecorationImage(
                          image: NetworkImage(course.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (course.rating > 0)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 14),
                              const SizedBox(width: 4),
                              Text(
                                course.rating.toString(),
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                
                // Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              course.category,
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (course.duration.isNotEmpty)
                             Text(
                              course.duration,
                              style: TextStyle(color: mutedColor, fontSize: 12),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        course.title,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        course.author, // HTML description logic can go here, but author is fine
                        style: TextStyle(color: mutedColor, fontSize: 12),
                      ),
                      const SizedBox(height: 16),
                      
                      // Footer
                      Row(
                        children: [
                          // Avatar placeholder
                           Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.person, size: 16, color: Colors.grey[600]),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            course.author, 
                            style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          // Button
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                              minimumSize: const Size(0, 32),
                            ),
                            child: const Text('Mulai', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
