import 'package:flutter/material.dart';

import 'create_Account.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  String selectedRole = "Owner";

  Widget buildRoleCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    bool isSelected = selectedRole == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isSelected ? const Color(0xff28485a) : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, size: 30),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            ),

            Radio(
              value: title,
              groupValue: selectedRole,
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

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
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),

              const SizedBox(height: 10),

              const Text(
                "Choose Role",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              buildRoleCard(
                icon: Icons.shopping_bag_outlined,
                title: "Buy",
                subtitle: "Browse properties for sale.",
              ),

              buildRoleCard(
                icon: Icons.key_outlined,
                title: "Rent",
                subtitle: "Find properties available for rent.",
              ),

              buildRoleCard(
                icon: Icons.home_work_outlined,
                title: "Owner",
                subtitle: "Add your own properties.",
              ),

              const Spacer(),

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CreateAccountScreen(role: selectedRole),
                      ),
                    );
                  },

                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
