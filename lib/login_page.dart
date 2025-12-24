import 'package:flutter/material.dart';
import 'package:tugas_uas/profile_page.dart';
import 'package:tugas_uas/register_page.dart';
import 'package:tugas_uas/main_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF135BEC);
    final backgroundColor = const Color(0xFFF6F6F8);
    final textMainColor = const Color(0xFF111318);
    final textMutedColor = const Color(0xFF4B5563);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.95),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: textMainColor),
              onPressed: () {}, // Can be updated if back navigation is needed
            ),
          ),
        ),
        title: Text(
          'Masuk',
          style: TextStyle(
            color: textMainColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            // Hero Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryColor, Colors.blue[400]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.school,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 24),
            // Title
            Text(
              'Selamat Datang Kembali',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: textMainColor,
              ),
            ),
            const SizedBox(height: 12),
            // Subtitle
            Text(
              'Silakan masuk untuk melanjutkan perjalanan belajar Anda.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: textMutedColor,
              ),
            ),
            const SizedBox(height: 32),

            // Form
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel('Email atau Nama Pengguna'),
                const SizedBox(height: 8),
                _buildInput(
                  controller: _emailController,
                  hintText: 'Masukkan email Anda',
                  icon: Icons.mail_outline,
                ),
                const SizedBox(height: 20),
                _buildLabel('Kata Sandi'),
                const SizedBox(height: 8),
                _buildInput(
                  controller: _passwordController,
                  hintText: 'Masukkan kata sandi',
                  isPassword: true,
                  obscureText: _obscurePassword,
                  onToggleVisibility: () => setState(() => _obscurePassword = !_obscurePassword),
                  suffixIcon: Icons.visibility_outlined, // Fallback if isPassword logic uses this
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Lupa Kata Sandi?',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      shadowColor: primaryColor.withOpacity(0.3),
                    ),
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),
            // Divider
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey[300])),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'ATAU LANJUTKAN DENGAN',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey[300])),
              ],
            ),
            const SizedBox(height: 24),

            // Social Buttons
            Row(
              children: [
                Expanded(
                  child: _buildSocialButton(
                    label: 'Google',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDrxpnsboLmUDdSO1HxxojZtwMX-EL-IRbvkSIf0nCR0pMhLOju6uHbpZX3_0LUP0AupmGNKGP079OmCQwieagyELqP22jGmf5wioNfa050kpj1VgyYx4CEmZJ83oYjkwUyFIKjbSwhvjQGqKHlZxR4Ujpr7Jy3j5rQcdJHuwF-J9zQWDUatFnFDQz6NYLcwDnkbLwNHcIPmQvhm5HgDT7Jmm8_a3NsTD5WpFR9g_nr9OxngK9WvycK96L-UlqoxHHCY7curOJRSdat',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSocialButton(
                    label: 'Apple',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCtVQ1fuBqBoi9yQTAnX3FksPKEFwxSMqzEiEWdVH7vlvs655bQR7BwqCQ0DVGVNmY6D8k_4as5u2WVcalLlD9H6mporUnw8ePZGcvUDt0kkSQluxmtS2MdM92wmAASMf9T-nRn32ep35v2xV0Rnnb1GLfRYkfuJBjzjDfcgkjRYFvFMGCkcbThdYOMtWudn-OInJFbBXlDBR3tBZHa45IsPGZIu0u_fJAC5ZQDgfb0LHlxlscBL9b1UMEzvb0Tn0U7gJNoVoI2aACh',
                    isInvert: true,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),
            // Sign Up Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya akun? ',
                  style: TextStyle(color: textMutedColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                  child: Text(
                    'Daftar sekarang',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // --- Backend Logic ---
  void _handleLogin() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan kata sandi harus diisi')),
      );
      return;
    }

    // Simulate Auth Check
    // if (email == "admin" && password == "admin") ...

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login Berhasil!')),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const MainScreen()),
    );
  }
  // --------------------

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xFF111318),
      ),
    );
  }

  Widget _buildInput({
    required TextEditingController controller,
    required String hintText,
    IconData? icon,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    IconData? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          prefixIcon: icon != null ? Icon(icon, color: Colors.grey[400]) : null,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey[400],
                  ),
                  onPressed: onToggleVisibility,
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      {required String label, required String imageUrl, bool isInvert = false}) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(imageUrl,
                  height: 20,
                  width: 20,
                  color: isInvert && Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : null),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF374151),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
