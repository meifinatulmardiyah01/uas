import 'package:flutter/material.dart';
import 'package:tugas_uas/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _agreedToTerms = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  
  // Controllers for "Backend" logic simulation
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Colors from design
    final primaryColor = const Color(0xFF135BEC);
    final backgroundColor = const Color(0xFFF6F6F8);
    final textMainColor = const Color(0xFF111318);
    final textMutedColor = const Color(0xFF64748B);
    final borderColor = const Color(0xFFE2E8F0);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 0,
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
          'DAFTAR',
          style: TextStyle(
            color: textMutedColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: borderColor,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Text(
              'Buat Akun Baru',
              style: TextStyle(
                fontSize: 28, // 3xl
                fontWeight: FontWeight.bold,
                color: textMainColor,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Mulai perjalanan belajar Anda hari ini. Isi data diri Anda di bawah ini.',
              style: TextStyle(
                fontSize: 16, // base
                color: textMutedColor,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 32),

            // Form Section
            _buildLabel('Nama Lengkap', textMainColor),
            const SizedBox(height: 8),
            _buildInput(
              controller: _nameController,
              hintText: 'Masukkan nama lengkap',
              icon: Icons.person_outline,
              borderColor: borderColor,
              focusColor: primaryColor,
            ),
            const SizedBox(height: 20),

            _buildLabel('Email', textMainColor),
            const SizedBox(height: 8),
            _buildInput(
              controller: _emailController,
              hintText: 'contoh@email.com',
              icon: Icons.mail_outline,
              borderColor: borderColor,
              focusColor: primaryColor,
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            _buildLabel('Kata Sandi', textMainColor),
            const SizedBox(height: 8),
            _buildInput(
              controller: _passwordController,
              hintText: 'Minimal 8 karakter',
              icon: Icons.lock_outline,
              borderColor: borderColor,
              focusColor: primaryColor,
              isPassword: true,
              obscureText: _obscurePassword,
              onToggleVisibility: () => setState(() => _obscurePassword = !_obscurePassword),
            ),
            const SizedBox(height: 20),

            _buildLabel('Konfirmasi Kata Sandi', textMainColor),
            const SizedBox(height: 8),
            _buildInput(
              controller: _confirmPasswordController,
              hintText: 'Ulangi kata sandi',
              icon: Icons.lock_reset,
              borderColor: borderColor,
              focusColor: primaryColor,
              isPassword: true,
              obscureText: _obscureConfirmPassword,
              onToggleVisibility: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
            ),
            const SizedBox(height: 12),

            // Terms Checkbox
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: _agreedToTerms,
                    activeColor: primaryColor,
                    side: BorderSide(color: Colors.grey[400]!),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    onChanged: (value) => setState(() => _agreedToTerms = value ?? false),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'Saya setuju dengan ',
                      style: TextStyle(color: textMutedColor, fontSize: 14),
                      children: [
                        TextSpan(
                          text: 'Syarat & Ketentuan',
                          style: TextStyle(color: primaryColor, decoration: TextDecoration.underline),
                        ),
                        TextSpan(text: ' serta '),
                        TextSpan(
                          text: 'Kebijakan Privasi',
                          style: TextStyle(color: primaryColor, decoration: TextDecoration.underline),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _agreedToTerms ? _handleRegister : null, // Backend logic trigger
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: _agreedToTerms ? 4 : 0,
                  shadowColor: primaryColor.withOpacity(0.25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Daftar Sekarang',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Divider
            Row(
              children: [
                Expanded(child: Divider(color: borderColor)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Atau daftar dengan',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[500]),
                  ),
                ),
                Expanded(child: Divider(color: borderColor)),
              ],
            ),
            const SizedBox(height: 24),

            // Social Buttons
            Row(
              children: [
                Expanded(child: _buildSocialButton('Google', 'https://lh3.googleusercontent.com/aida-public/AB6AXuDrxpnsboLmUDdSO1HxxojZtwMX-EL-IRbvkSIf0nCR0pMhLOju6uHbpZX3_0LUP0AupmGNKGP079OmCQwieagyELqP22jGmf5wioNfa050kpj1VgyYx4CEmZJ83oYjkwUyFIKjbSwhvjQGqKHlZxR4Ujpr7Jy3j5rQcdJHuwF-J9zQWDUatFnFDQz6NYLcwDnkbLwNHcIPmQvhm5HgDT7Jmm8_a3NsTD5WpFR9g_nr9OxngK9WvycK96L-UlqoxHHCY7curOJRSdat')),
                const SizedBox(width: 16),
                Expanded(child: _buildSocialButton('Apple', 'https://lh3.googleusercontent.com/aida-public/AB6AXuCtVQ1fuBqBoi9yQTAnX3FksPKEFwxSMqzEiEWdVH7vlvs655bQR7BwqCQ0DVGVNmY6D8k_4as5u2WVcalLlD9H6mporUnw8ePZGcvUDt0kkSQluxmtS2MdM92wmAASMf9T-nRn32ep35v2xV0Rnnb1GLfRYkfuJBjzjDfcgkjRYFvFMGCkcbThdYOMtWudn-OInJFbBXlDBR3tBZHa45IsPGZIu0u_fJAC5ZQDgfb0LHlxlscBL9b1UMEzvb0Tn0U7gJNoVoI2aACh', isInvert: true)),
              ],
            ),
            
            const SizedBox(height: 32),

            // Footer Link
             Center(
              child: Text.rich(
                TextSpan(
                  text: 'Sudah punya akun? ',
                  style: TextStyle(color: textMutedColor, fontSize: 14),
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        },
                        child: Text(
                          'Masuk di sini',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // --- Backend/Logic Simulation ---
  void _handleRegister() {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mohon lengkapi semua data')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kata sandi tidak cocok')),
      );
      return;
    }

    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kata sandi minimal 8 karakter')),
      );
      return;
    }

    // "Backend" Success
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Akun berhasil dibuat! Silakan masuk.')),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
  // -------------------------

  Widget _buildLabel(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color),
      ),
    );
  }

  Widget _buildInput({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required Color borderColor,
    required Color focusColor,
    TextInputType inputType = TextInputType.text,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // dark:bg-surface-dark
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
        keyboardType: inputType,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          prefixIcon: Icon(icon, color: Colors.grey[400]), // Left icon
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

  Widget _buildSocialButton(String label, String imageUrl, {bool isInvert = false}) {
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
              Image.network(imageUrl, height: 20, width: 20, color: isInvert && Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF111318)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
