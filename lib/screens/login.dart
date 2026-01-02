import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignIn = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8FC),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Column(
            children: [

              Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  color: const Color(0xff0D47A1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.shield_outlined,
                    color: Colors.white, size: 36),
              ),

              const SizedBox(height: 20),

              const Text(
                "CampusCare",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                "Your voice matters. Report issues, stay connected.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),


              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                    )
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xffEEF1F6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            _authTab("Sign In", true),
                            _authTab("Sign Up", false),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.g_mobiledata, size: 30),
                        label: const Text("Continue with Google"),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text("OR CONTINUE WITH EMAIL",
                          style: TextStyle(color: Colors.grey)),

                      const SizedBox(height: 20),


                      _inputField(
                        label: "Email",
                        hint: "your.email@college.edu",
                        icon: Icons.email_outlined,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          }
                          if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),


                      _inputField(
                        label: "Password",
                        hint: "********",
                        icon: Icons.lock_outline,
                        obscure: true,
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),


                      if (!isSignIn) ...[
                        const SizedBox(height: 16),
                        _inputField(
                          label: "Confirm Password",
                          hint: "********",
                          icon: Icons.lock_outline,
                          obscure: true,
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Confirm your password";
                            }
                            if (value != passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),
                      ],

                      const SizedBox(height: 24),


                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {

                            print("Email: ${emailController.text}");
                            print("Password: ${passwordController.text}");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0D47A1),
                          minimumSize: const Size(double.infinity, 52),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          isSignIn ? "Sign In" : "Sign Up",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "© 2025 CampusCare by BlindSpot Devs",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _authTab(String text, bool signInTab) {
    final isSelected = isSignIn == signInTab;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => isSignIn = signInTab);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xff0D47A1) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }


  Widget _inputField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool obscure = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hint,
            filled: true,
            fillColor: const Color(0xffF6F8FC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
