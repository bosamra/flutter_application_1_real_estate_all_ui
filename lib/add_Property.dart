import 'package:flutter/material.dart';

class AddPropertyPage extends StatefulWidget {
  const AddPropertyPage({super.key});

  @override
  State<AddPropertyPage> createState() => _AddPropertyPageState();
}

class _AddPropertyPageState extends State<AddPropertyPage> {
  // ignore: unused_field
  final TextEditingController _titleController = TextEditingController();

  String _selectedPropertyType = 'Villas';
  String _selectedListingType = 'Rent';

  final List<String> _propertyTypes = ['Villas', 'Chalets', 'Apartments'];
  final List<String> _listingTypes = ['Rent', 'Sale'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Add Property",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader("Property photos"),
                  const Text(
                    "Add clear photos first. The admin will review the property before it appears in Home.",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 15),
                  _buildUploadBox(),
                  const SizedBox(height: 25),
                  _buildSectionHeader("Basic details"),
                  _buildCustomTextField(
                    hint: "Property Title",
                    icon: Icons.title,
                  ),
                  _buildCustomTextField(
                    hint: "Description",
                    icon: Icons.description,
                    maxLines: 3,
                  ),
                  _buildCustomTextField(
                    hint: "Location / Address",
                    icon: Icons.map_outlined,
                    suffix: Icons.open_in_new,
                  ),

                  _buildDropdownField(
                    label: "Property Type",
                    icon: Icons.apartment,
                    value: _selectedPropertyType,
                    items: _propertyTypes,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedPropertyType = newValue!;
                      });
                    },
                  ),

                  _buildDropdownField(
                    label: "Listing Type",
                    icon: Icons.label_outline,
                    value: _selectedListingType,
                    items: _listingTypes,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedListingType = newValue!;
                      });
                    },
                  ),

                  const SizedBox(height: 25),
                  _buildSectionHeader("Numbers"),
                  _buildCustomTextField(
                    hint: "Price",
                    icon: Icons.attach_money,
                    type: TextInputType.number,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCustomTextField(
                              hint: "Beds / Rooms",
                              type: TextInputType.number,
                            ),
                            const Text(
                              " 0 is allowed for offices.",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildCustomTextField(
                          hint: "Baths",
                          type: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  _buildCustomTextField(
                    hint: "Area",
                    icon: Icons.straighten,
                    type: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildUploadBox() {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.add_photo_alternate_outlined,
            size: 45,
            color: Color(0xFF1E3A47),
          ),
          SizedBox(height: 10),
          Text(
            "Tap to upload property images",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            "At least one image is required",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTextField({
    required String hint,
    IconData? icon,
    IconData? suffix,
    int maxLines = 1,
    TextInputType type = TextInputType.text,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        maxLines: maxLines,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
          suffixIcon: suffix != null ? Icon(suffix, color: Colors.grey) : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required IconData icon,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 13, color: Colors.grey),
          prefixIcon: Icon(icon, color: Colors.grey),
          border: InputBorder.none,
        ),
        icon: const Icon(Icons.arrow_drop_down),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E3A47),
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.send, color: Colors.white, size: 18),
            SizedBox(width: 10),
            Text(
              "Submit for Review",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
