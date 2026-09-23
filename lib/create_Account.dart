import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  final String role;

  const CreateAccountScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final confirmPassController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: Text(
                    role.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                Text(
                  "Use a valid email and a strong password.",
                  style: TextStyle(color: Colors.grey.shade600),
                ),

                const SizedBox(height: 35),

                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: const Icon(Icons.person_outline),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: emailController,

                  decoration: InputDecoration(
                    hintText: "Email",

                    prefixIcon: const Icon(Icons.email_outlined),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: passController,
                  obscureText: true,

                  decoration: InputDecoration(
                    hintText: "Password",

                    prefixIcon: const Icon(Icons.lock_outline),

                    suffixIcon: const Icon(Icons.visibility_off),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "At least 8 chars, with uppercase and number.",
                  style: TextStyle(color: Colors.grey.shade600),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: confirmPassController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: const Icon(Icons.visibility_off),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 60,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff28485a),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),

                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const Home_screen()),
                      );
                    },

                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text("Already have an account? Login here"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
