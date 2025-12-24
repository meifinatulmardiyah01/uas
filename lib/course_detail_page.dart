import 'package:flutter/material.dart';
import 'package:tugas_uas/course_learning_page.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    // Colors from design
    final primaryColor = const Color(0xFF135BEC);
    final backgroundColor = const Color(0xFFF6F6F8);
    final surfaceColor = Colors.white;
    final textMainColor = const Color(0xFF0F172A);
    final textMutedColor = const Color(0xFF64748B);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // Sticky App Bar
                SliverAppBar(
                  backgroundColor: backgroundColor.withOpacity(0.95),
                  elevation: 0,
                  pinned: true,
                  floating: true,
                  centerTitle: true,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: textMainColor),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  title: Text(
                    'Detail Kursus',
                    style: TextStyle(
                      color: textMainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          icon: Icon(Icons.share, color: textMainColor),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),

                // Content
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Video Header
                        Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://lh3.googleusercontent.com/aida-public/AB6AXuDJVdLmS2n_J8bJVucQmOEh3B-p36Jg5K3EsWzvX3NsRrjPss1qKrjvFG2Zrs8eoR6-vghpjvwFgj9rRCl8ARo54OHb3FIaDT41ToZMe9DHSPUPAyuEOc7qYRxg3O3zsspKBrTHMJKfvNyQN1q1ZNkKgFbY5ulg4dclDE6iaynt7s9FliMAAPbQ9eolal03DwHpUOVLzxDTDfUPS74tjqcvtFZgND2YfUY0i6L-vQSosL02z1KLw-FEcWYdpOQNMS6oQ3sylq9amSD2"),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.6),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 16,
                                left: 16,
                                right: 16,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color: Colors.white.withOpacity(0.3)),
                                      ),
                                      child: const Text(
                                        'Video Course',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white.withOpacity(0.3)),
                                      ),
                                      child: const Icon(Icons.play_arrow_rounded,
                                          color: Colors.white, size: 24),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Title
                        Text(
                          'Mastering Mobile UI/UX Design',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: textMainColor,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Rating & Info
                        Row(
                          children: [
                            const Icon(Icons.star_rounded,
                                color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              '4.8',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: textMainColor,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '(124 reviews)',
                              style: TextStyle(color: textMutedColor, fontSize: 13),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child:
                                  Icon(Icons.circle, size: 4, color: Colors.grey),
                            ),
                            Text(
                              '1,204 Siswa',
                              style: TextStyle(color: textMutedColor, fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Chips
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildInfoChip(Icons.bar_chart, 'Menengah', textMutedColor, backgroundColor),
                            _buildInfoChip(Icons.schedule, '4h 30m', textMutedColor, backgroundColor),
                            _buildInfoChip(Icons.verified, 'Sertifikat', textMutedColor, backgroundColor),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Instructor
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: surfaceColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey[200]!),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage: const NetworkImage(
                                    "https://lh3.googleusercontent.com/aida-public/AB6AXuCs3DmzGVf3L6HbPgqEuFEqhYsmpiZmj-9Y60fZUGVsDJMy8CSP8aDZUniSsl7iOveDF5AUSvPxEIMhl3v7JrrhA0d0pyX02wCTIkmU6HMaJ8m6AAdiDwXDx44eaI71rPVA6krTUF2I9msswS7e31N1NhLUfJXz9oK6nd1yPJk3cVeclb-M6L1uteOejB8EZ-J_DLdYgfrju0R0SwlcBHC_O4V9VyJrWYMSox7VrCgG_tMBCyrAQGI8W0DG8y_-GXigBrEy6Jbmkpru"), // Budi Santoso
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Budi Santoso',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: textMainColor,
                                      ),
                                    ),
                                    Text(
                                      'Senior Product Designer',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: textMutedColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Lihat Profil',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),

                // Sticky Tabs
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverTabDelegate(
                    TabBar(
                      controller: _tabController,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      indicator: BoxDecoration(
                        color: surfaceColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: textMainColor,
                      unselectedLabelColor: textMutedColor,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      tabs: const [
                        Tab(text: 'Deskripsi'),
                        Tab(text: 'Silabus'),
                      ],
                    ),
                    backgroundColor,
                  ),
                ),
                
                // Tab Content - We'll use SliverToBoxAdapter for content based on tab
                // Note: TabBarView inside CustomScrollView is tricky. 
                // For simplicity/performance in this specific UI structure,
                // we'll listen to the controller and rebuild or just show a long list with sections.
                // Or better, just put the content logic here since standard TabBarView doesn't work well inside Slivers unless nested.
                // Let's use a simple single column for "Deskripsi" which seems to be the main view in HTML.
                // The HTML implies tabs but shows Description content first.
                // We will render the Description content here.
                
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    // Determine content based on tab? 
                    // To handle tab switching properly in a SliverList, we should wrap this part.
                    // For this task, I'll render the full content as per HTML 'Deskripsi' tab active state.
                    child: AnimatedBuilder(
                      animation: _tabController,
                      builder: (context, _) {
                        return _tabController.index == 0
                           ? _buildDescriptionContent(primaryColor, textMainColor, textMutedColor, surfaceColor)
                           : _buildSyllabusContent(primaryColor, textMainColor, textMutedColor, surfaceColor);
                      },
                    ),
                  ),
                ),

                // Space for Fixed Bottom Bar
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
              ],
            ),

            // Fixed Bottom Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surfaceColor,
                  border: Border(top: BorderSide(color: Colors.grey[200]!)),
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Total Harga',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: textMutedColor,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                'Rp 199.000',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Rp 499.000',
                                style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CourseLearningPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                              shadowColor: primaryColor.withOpacity(0.4),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Mulai Belajar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label, Color textColor, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionContent(Color primaryColor, Color textMainColor, Color textMutedColor, Color surfaceColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Yang akan Anda pelajari',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textMainColor,
          ),
        ),
        const SizedBox(height: 12),
        _buildCheckItem('Memahami prinsip dasar desain antarmuka aplikasi mobile yang modern dan responsif.', textMutedColor),
        _buildCheckItem('Menggunakan Figma untuk membuat wireframe hingga prototype interaktif.', textMutedColor),
        _buildCheckItem('Menerapkan prinsip UX research untuk validasi ide desain.', textMutedColor),
        
        const SizedBox(height: 24),
        Text(
          'Tentang Kursus',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textMainColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Kursus ini dirancang untuk pemula hingga tingkat menengah yang ingin mendalami dunia desain produk digital. Anda akan belajar langkah demi langkah bagaimana membangun portofolio desain yang kuat.',
          style: TextStyle(
            fontSize: 14,
            height: 1.6,
            color: textMutedColor,
          ),
        ),
        TextButton.icon(
          onPressed: (){},
          icon: Text(
            'Baca Selengkapnya', 
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor)
          ),
          label: Icon(Icons.expand_more, size: 16, color: primaryColor),
          style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
        ),

        const SizedBox(height: 24),
        Text(
          'Ulasan Siswa',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textMainColor,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Row(
                     children: [
                       const CircleAvatar(
                         backgroundImage: NetworkImage("https://lh3.googleusercontent.com/aida-public/AB6AXuBt6Y39Vmpj4BBus1Su9IGYFrKOYe7uo5kFFtemGnUvXeCMNjqwGdkKZoMa6vsbxL4VUlBjv2oX6N85MaZKDlpSmN8_G_IJo-E3mdXMkLBaJ0AXQJ48rwuk8iKlN3sJtroz7u5UfjDWpYVymVkHtfrShpP7CrgG-_UuHKqIabua_ZjokJNNm2_A3mWwC1Gaer-yHbLUJgvbeNQQI3B_u_eqmSvnhYsD8a6C9Btrdfs_I6ktzId1rQuADjZjC9MQ3ObrnOQ6xAf4H8A4"),
                         radius: 16,
                       ),
                       const SizedBox(width: 8),
                       Text('Ahmad Dani', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: textMainColor)),
                     ],
                   ),
                   Text('2 hari lalu', style: TextStyle(fontSize: 12, color: textMutedColor)),
                 ],
               ),
               const SizedBox(height: 8),
               // Stars
               Row(
                 children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.amber, size: 16)),
               ),
               const SizedBox(height: 8),
               Text(
                 'Materinya sangat daging! Penjelasannya mudah dimengerti untuk pemula seperti saya.',
                 style: TextStyle(fontSize: 14, color: textMutedColor, height: 1.5),
               ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: (){},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              side: BorderSide(color: Colors.grey[300]!),
            ),
            child: Text('Lihat Semua Ulasan', style: TextStyle(color: textMainColor)),
          ),
        ),
      ],
    );
  }

  Widget _buildSyllabusContent(Color primaryColor, Color textMainColor, Color textMutedColor, Color surfaceColor) {
    return Column(
      children: [
        _buildModuleItem(
          '1. Pengenalan UI/UX',
          '2 Video • 15 Menit',
          [
            _buildLessonItem('Apa itu UI vs UX?', '08:30', isCompleted: true),
            _buildLessonItem('Pola Pikir Desainer', '06:30', isLocked: false),
          ],
          surfaceColor,
          textMainColor,
          textMutedColor,
        ),
        const SizedBox(height: 16),
         _buildModuleItem(
          '2. Fundamental Desain',
          '4 Video • 45 Menit',
          [], // Collapsed by default/empty for demo
          surfaceColor,
          textMainColor,
          textMutedColor,
        ),
      ],
    );
  }

  Widget _buildCheckItem(String text, Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleItem(String title, String subtitle, List<Widget> children, Color surface, Color text, Color muted) {
    return Container(
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: text)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 12, color: muted)),
        children: children,
      ),
    );
  }

  Widget _buildLessonItem(String title, String duration, {bool isCompleted = false, bool isLocked = true}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[100]!)),
      ),
      child: Row(
        children: [
          Container(
            width: 32, height: 32,
            decoration: BoxDecoration(
              color: isLocked ? Colors.grey[200] : const Color(0xFF135BEC).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.play_arrow, size: 16, color: isLocked ? Colors.grey : const Color(0xFF135BEC)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                Text(duration, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          if (isCompleted)
             const Icon(Icons.check_circle, color: Colors.green, size: 20)
          else if (isLocked && !isCompleted)
             const Icon(Icons.lock_outline, color: Colors.grey, size: 18)
          else 
              const Icon(Icons.lock_open, color: Color(0xFF135BEC), size: 18),
        ],
      ),
    );
  }
}

class _SliverTabDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  final Color _backgroundColor;

  _SliverTabDelegate(this._tabBar, this._backgroundColor);

  @override
  double get minExtent => _tabBar.preferredSize.height + 16; // Add padding
  @override
  double get maxExtent => _tabBar.preferredSize.height + 16;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: _backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabDelegate oldDelegate) {
    return false;
  }
}
