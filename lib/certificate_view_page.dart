import 'package:flutter/material.dart';

class CertificateViewPage extends StatelessWidget {
  const CertificateViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF135BEC);
    const backgroundDark = Color(0xFF111318);
    const textWhite = Colors.white;

    return Scaffold(
      backgroundColor: backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: textWhite),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Sertifikat Kursus',
          style: TextStyle(color: textWhite, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: textWhite),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Certificate Container
            AspectRatio(
              aspectRatio: 1.414, // Standard A4 ratio
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: primaryBlue.withOpacity(0.2),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      // Background Pattern (Placeholder)
                      Positioned.fill(
                        child: CustomPaint(
                          painter: CertificatePainter(primaryBlue),
                        ),
                      ),
                      // Content
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'CERTIFICATE',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 4,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                            const Text(
                              'OF COMPLETION',
                              style: TextStyle(
                                fontSize: 10,
                                letterSpacing: 2,
                                color: Color(0xFF64748B),
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              'Diberikan kepada:',
                              style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                color: Color(0xFF64748B),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'PENGGUNA SETIA',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E293B),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFFACC15),
                                decorationThickness: 4,
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              'Atas keberhasilan menyelesaikan kursus:',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF64748B),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Mastering Figma 2024: Dari Nol ke Pro',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildSign('24 Des 2025', 'Tanggal'),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: primaryBlue.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: primaryBlue),
                                  ),
                                  child: Icon(Icons.verified, color: primaryBlue, size: 24),
                                ),
                                _buildSign('Course Mentor', 'Instruktur'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('Unduh Sertifikat (PDF)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text('Bagikan ke LinkedIn', style: TextStyle(color: textWhite)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSign(String text, String label) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        Container(
          width: 80,
          height: 1,
          color: const Color(0xFFCBD5E1),
          margin: const EdgeInsets.symmetric(vertical: 4),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 8,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );
  }
}

class CertificatePainter extends CustomPainter {
  final Color primary;
  CertificatePainter(this.primary);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = primary.withOpacity(0.05)
      ..style = PaintingStyle.fill;

    // Corner decorative patterns
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(100, 0)
      ..quadraticBezierTo(0, 0, 0, 100)
      ..close();
    canvas.drawPath(path, paint);

    canvas.save();
    canvas.translate(size.width, size.height);
    canvas.rotate(3.14159);
    canvas.drawPath(path, paint);
    canvas.restore();

    final borderPaint = Paint()
      ..color = primary.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    canvas.drawRect(
      Rect.fromLTRB(10, 10, size.width - 10, size.height - 10),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
