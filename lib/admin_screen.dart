import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        // ================= APP BAR =================

        appBar: AppBar(
          title: Text("Admin Dashboard"),

          backgroundColor: Colors.white,

          elevation: 0,

          bottom: TabBar(
            labelColor: Colors.black,

            tabs: [
              Tab(text: "Pending Approvals"),

              Tab(text: "Live Properties"),
            ],
          ),
        ),

        // ================= BODY =================
        body: TabBarView(
          children: [
            // ================= PENDING PAGE =================

            ListView(
              children: [
                pendingCard("Apartment in Mansoura", "850,000 EL", "Apartment"),

                pendingCard("Villa in Tagamoa", "2,500,000 EL", "Villa"),
              ],
            ),

            // ================= LIVE PAGE =================
            ListView(
              children: [
                propertyCard("Apartment in Cairo", "1,200,000 EL", "Apartment"),

                propertyCard("Villa in Sheikh Zayed", "3,000,000 EL", "Villa"),

                propertyCard(
                  "Apartment in Alexandria",
                  "950,000 EL",
                  "Apartment",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ================= LIVE PROPERTY CARD =================

  Widget propertyCard(String title, String price, String type) {
    return Container(
      margin: EdgeInsets.all(15),

      padding: EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.grey[200],

        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,

            decoration: BoxDecoration(
              color: Colors.blue,

              borderRadius: BorderRadius.circular(15),
            ),
          ),

          SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,

                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              Text(price, style: TextStyle(fontSize: 17)),

              SizedBox(height: 10),

              Text(type),

              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  print("View Details");
                },

                child: Text("View Details"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= PENDING CARD =================

  Widget pendingCard(String title, String price, String type) {
    return Container(
      margin: EdgeInsets.all(15),

      padding: EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.grey[300],

        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,

            decoration: BoxDecoration(
              color: Colors.orange,

              borderRadius: BorderRadius.circular(15),
            ),
          ),

          SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,

                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              Text(price, style: TextStyle(fontSize: 17)),

              SizedBox(height: 10),

              Text(type),

              SizedBox(height: 10),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("Approved");
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),

                    child: Text("Approve"),
                  ),

                  SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      print("Rejected");
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),

                    child: Text("Reject"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
