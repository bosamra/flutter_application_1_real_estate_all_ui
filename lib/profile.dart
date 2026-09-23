import 'package:flutter/material.dart';

import 'welcome_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String email;
  final String role;

  const ProfileScreen({super.key, required this.email, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Profile",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 40),

              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: const Color(0xff28485a),

                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "User Name",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      email,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Text(
                        role.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              ListTile(
                leading: const Icon(Icons.home_work_outlined),
                title: const Text("My Properties"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 18),

                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: const Center(
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
