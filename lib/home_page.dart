import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from HTML/Tailwind config
    final primaryColor = const Color(0xFF135BEC);
    final backgroundColor = const Color(0xFFF6F6F8);
    final surfaceColor = Colors.white;
    final textMainColor = const Color(0xFF0F172A);
    final textMutedColor = const Color(0xFF64748B);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100), // Space for BottomNav
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top App Bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg"), // Consistent Female Portrait
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  color: primaryColor.withOpacity(0.2),
                                  width: 2,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: backgroundColor, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Pagi,',
                              style: TextStyle(
                                fontSize: 12,
                                color: textMutedColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Meifinatul Mardiyah',
                              style: TextStyle(
                                fontSize: 18,
                                color: textMainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: surfaceColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(Icons.notifications_outlined,
                              color: textMainColor),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[200]!),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey[400]),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Cari kursus, mentor...',
                          style: TextStyle(color: Colors.grey[400], fontSize: 14),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.tune, color: primaryColor, size: 20),
                      ),
                    ],
                  ),
                ),
              ),

              // Notification Banner
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red.withOpacity(0.1), Colors.transparent],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    border: const Border(
                        left: BorderSide(color: Colors.red, width: 4)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.warning_amber_rounded,
                            color: Colors.red, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tenggat Waktu!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: textMainColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Tugas Akhir UX Design harus dikumpulkan besok sebelum jam 23:59 WIB.',
                              style: TextStyle(
                                color: textMutedColor,
                                fontSize: 12,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Courses Scroll
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lanjutkan Belajar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textMainColor,
                      ),
                    ),
                    Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildCourseCard(
                      'Dasar UX Design',
                      'Modul 4/12',
                      0.75,
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuA4aZMY4ADwxmfBND-CLZqx8MYXqb86ChP6JZ4rl6YR1Cbzs1X_vzPxdzXdA-ayCURHbmfNBv-AwzLS0QSM5JS-WEK6FNCx-5IYFp-DD6lv7ogWrO-M6IFvwhtitGL9G3bRUjkbkuhINS-5AD8Hy-ZufLsAiHMW822Yt3PL1Yz9w6v9mYbEB9l1dsJSqOtmLqXqf0_OegUt5NyWUCpySfDrzT48wz7-NFHlSyKawXP16PAchf51UNocI-g6Hr_ouOnAligVea6ephWD",
                      primaryColor,
                      surfaceColor,
                      textMainColor,
                      textMutedColor,
                    ),
                    const SizedBox(width: 16),
                    _buildCourseCard(
                      'Python untuk Data Science',
                      'Modul 2/10',
                      0.20,
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuAhbu8uRf2fxedhnG3n7fFGV2-sEV8gTFxARKxU1AiO8aG0eovobLJI6kZxNVsTDEg8zQ27QzdL4teFkke-R6mcHcgt7zc8OyGHjcH8MD1eWZYqqcUbzKDCyUWDVMnU6V2kBXwu2-QqqKZzxlswl3Dlgf-_wbe9pwccMbKcs4Lbi2a6svXPR8RivXJlnoArO-tAf9N3OyHORdIGjD1G0TNxOgOhz-Z-n83oo_IUgFkVash8ZHYtvL7wm-PI2aQVclM_tnNdFTnXo-oE",
                      primaryColor,
                      surfaceColor,
                      textMainColor,
                      textMutedColor,
                    ),
                  ],
                ),
              ),

              // Recommendations
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Text(
                  'Rekomendasi Untukmu',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textMainColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildRecommendationCard(
                      'Digital Marketing 101',
                      'Oleh Sarah Wijaya',
                      'Rp 150.000',
                      4.8,
                      'Populer',
                      Colors.green,
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuD2mWgV60SCFcCyrUzTkkoSbJhiFru65yTsPZmIW_Uy-k0qnBkBBxOMS4ZfbDm4AzPe9zEynVCVbvhONM8_8hv2h2omZt4lyxo53-dhCHrruuPqcanrp5BYsJr1WtyXEiKJjqCqGErEmIs4Omq4jKUDwwmNblte52KhZfQVLgKrHjTuwhS8sofNiQPNW6FOPVIfh2giwEokrjbx4BjoPsvcPYpWZgYp4_0NBc7gRX9Lt0jEqBeU744pa5Z8_uW-N_jbNBRIrGuH8laA",
                      surfaceColor,
                      textMainColor,
                      textMutedColor,
                      primaryColor, // Price color
                    ),
                    const SizedBox(height: 16),
                    _buildRecommendationCard(
                      'Blender 3D untuk Pemula',
                      'Oleh Doni Pratama',
                      'Gratis',
                      4.5,
                      'Baru',
                      primaryColor,
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuAvZAiZQs2pWNq5beepA8Ab_tRTQFVUtdRlRuAsC3hs07nY57Qmh-lRHEoPAxhkUIdyKLjF1nCWVclSWHXfoMJPsFcayVMu1ojjXl-7oDWbLI7obftO7tK3h5OUwJe0g-rrJCjTgmIxi32JtWwS4nF2vJbRtQ3qBJkm6U7_EuNyGgnqUf6fj0Lq0EjYUt-fReah1o7JJ5rpflCSZT5cbIy2ltOL-A27QFIJwbarA8gxYcWHDpFnc1MydAxkaK7uZVH062cXuYhKe0HW",
                      surfaceColor,
                      textMainColor,
                      textMutedColor,
                      primaryColor,
                    ),
                    const SizedBox(height: 16),
                    _buildRecommendationCard(
                      'Copywriting Masterclass',
                      'Oleh Anita Kusuma',
                      'Rp 200.000',
                      4.9,
                      'Best Seller',
                      Colors.purple,
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuDTOCLDbYZw6jErvRKfmp-H9QcE2_jYoyiv0yW3oCt0Je83glvZZ2mv4KVpV7pYqREIYUt1SC2ydModRp9y0JUKmlHsw00xfRqhGYSJxB4N4-IJ72T3PdUiO8nb41wDmPaedCD1Iacjp86j7KdKlo3vyqHMxk_KAv0RI42RzuIzgCra17TQlCAu6iQ9xz0-NHBrH3GLxt07pibtUeTul0x3OsEiemj6PDYV3sQ6v3NdSNU4gT6kRVb2UG5gsPORZwdOvWbEz8ZQg2Z4",
                      surfaceColor,
                      textMainColor,
                      textMutedColor,
                      primaryColor,
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

  Widget _buildCourseCard(
      String title,
      String progressText,
      double progress,
      String imageUrl,
      Color primaryColor,
      Color surfaceColor,
      Color textColor,
      Color mutedColor) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 128,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.play_arrow_rounded,
                    color: Colors.white, size: 24),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                progressText,
                style: TextStyle(
                  fontSize: 12,
                  color: mutedColor,
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 12,
                  color: mutedColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[100],
              color: primaryColor,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard(
      String title,
      String author,
      String price,
      double rating,
      String badgeText,
      Color badgeColor,
      String imageUrl,
      Color surfaceColor,
      Color textColor,
      Color mutedColor,
      Color priceColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: badgeColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        badgeText,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: badgeColor,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star_rounded,
                            color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  author,
                  style: TextStyle(
                    fontSize: 12,
                    color: mutedColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: priceColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
