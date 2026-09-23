import 'package:flutter/material.dart';

import 'property_Details.dart';
import 'add_Property.dart';
import 'profile.dart';
import 'favorites_screen.dart';
import 'admin_screen.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  String selectedCategory = "All Categories";
  int _selectedIndex = 0;

  //  category Build function
  Widget buildCatItems(String title) {
    bool isSelected = title == selectedCategory;
    return InkWell(
      onTap: () {
        setState(() {
          selectedCategory = title;
          print("category : $title");
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 18),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------------------------------------------------------------------
  // ----------------------------------------------------------------------------------------------------------------
  // ----------------------------------------------------------------------------------------------------------------

  // property card builing function
  Widget buildProCard(
    BuildContext context,
    String price,
    String titleAndloaction,
    String beds,
    String baths,
  ) {
    return Container(
      height: 275, // 273
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Icon(Icons.image, size: 50, color: Colors.grey),
          ),

          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7),
                Text(titleAndloaction, style: TextStyle(color: Colors.grey)),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.bed, size: 20, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(beds),
                    SizedBox(width: 35),
                    Icon(Icons.bathtub, size: 20, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(baths),

                    Spacer(),

                    Transform.translate(
                      offset: Offset(0, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PropertyDetailsScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "View Details →",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome, ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  "username.",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Find your dream house...",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(Icons.filter_list, color: Colors.white),
                ),
              ],
            ),

            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCatItems("All Categories"),
                  buildCatItems("Apartments"),
                  buildCatItems("Villas"),
                  buildCatItems("Chalets"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Available properties",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  buildProCard(
                    context,
                    "EGP 2,950,000",
                    "Luxury Apartment in Cairo, Maadi",
                    "5 Beds",
                    "2 Baths",
                  ),
                  SizedBox(height: 20),
                  buildProCard(
                    context,
                    "EGP 2,200,000",
                    "Luxury Apartment in Alexandria, Smouha",
                    "3 Beds",
                    "1 Bath",
                  ),
                  SizedBox(height: 20),
                  buildProCard(
                    context,
                    "EGP 1,000,000",
                    "Luxury Apartment in Giza, Boulaq",
                    "3 Beds",
                    "2 Baths",
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget currentBody;
    switch (_selectedIndex) {
      case 0:
        currentBody = _buildHomeContent(context);
        break;
      case 1:
        currentBody = const FavoritesScreen();
        break;
      case 2:
        currentBody = const AdminScreen();
        break;
      case 3:
        currentBody = const ProfileScreen(email: "user@mail.com", role: "User");
        break;
      default:
        currentBody = _buildHomeContent(context);
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: currentBody,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: "Admin",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPropertyPage(),
                  ),
                );
              },
              label: const Text(
                "Post your property",
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.add, color: Colors.white),
              backgroundColor: Colors.black,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
