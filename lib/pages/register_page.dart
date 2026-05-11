import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _unameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool obscure = false,
    VoidCallback? onToggle,
    TextInputType keyboard = TextInputType.text,
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: isLast
          ? null
          : BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200)),
            ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? obscure : false,
        keyboardType: keyboard,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.orange),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: onToggle,
                )
              : null,
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.orange.shade900,
              Colors.orange.shade800,
              Colors.orange.shade400,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),

                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInDown(
                          duration: const Duration(milliseconds: 800),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.arrow_back_ios_new,
                                  color: Colors.white, size: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: const Text(
                            "Daftar Akun",
                            style: TextStyle(
                                color: Colors.white, fontSize: 36),
                          ),
                        ),
                        const SizedBox(height: 6),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1200),
                          child: const Text(
                            "Buat akun CaterSmart baru 🍱",
                            style: TextStyle(
                                color: Colors.white70, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Form card
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(30, 40, 30, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),

                          // Input fields
                          FadeInUp(
                            duration: const Duration(milliseconds: 1300),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  _buildTextField(
                                    controller: _unameController,
                                    hint: "Username",
                                    icon: Icons.person_outline,
                                  ),
                                  _buildTextField(
                                    controller: _passwordController,
                                    hint: "Password",
                                    icon: Icons.lock_outline,
                                    isPassword: true,
                                    obscure: _obscurePassword,
                                    onToggle: () => setState(() =>
                                        _obscurePassword = !_obscurePassword),
                                  ),
                                  _buildTextField(
                                    controller: _confirmPasswordController,
                                    hint: "Konfirmasi Password",
                                    icon: Icons.lock_outline,
                                    isPassword: true,
                                    obscure: _obscureConfirm,
                                    onToggle: () => setState(
                                        () => _obscureConfirm = !_obscureConfirm),
                                    isLast: true,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 36),

                          // Tombol Daftar
                          FadeInUp(
                            duration: const Duration(milliseconds: 1500),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: hubungkan ke logic register
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange[900],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: const Text(
                                  "Daftar",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const Spacer(),

                          // Link balik ke Login
                          FadeInUp(
                            duration: const Duration(milliseconds: 1600),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sudah punya akun? ",
                                  style:
                                      TextStyle(color: Colors.grey.shade600),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.orange.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}