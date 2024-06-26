import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import statement
import 'package:skincare/pages/navbar_admin.dart';

class AddProductForm extends StatelessWidget {
  AddProductForm({super.key});

  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final categoryController = TextEditingController();
  final priceController = TextEditingController();
  final ratingController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffde1e1),
      appBar: AppBar(
        backgroundColor: const Color(0xff925857),
        elevation: 0,
        foregroundColor: const Color(0xfffde1e1),
        title: Text(
          'Add New Product',
          style: GoogleFonts.poppins(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFieldWithLabel(label: 'Name', controller: nameController),
              TextFieldWithLabel(
                  label: 'Image URL', controller: imageController),
              DropdownFieldWithLabel(
                  label: 'Category', controller: categoryController),
              TextFieldWithLabel(label: 'Price', controller: priceController),
              TextFieldWithLabel(label: 'Rating', controller: ratingController),
              TextFieldWithLabel(
                  label: 'Description', controller: descController),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => NavbarAdmin()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff925857)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
                ),
                child: Text('Save Product', style: GoogleFonts.poppins()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const TextFieldWithLabel({super.key, 
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5.0),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: 'Enter $label',
              hintStyle: TextStyle(color: Colors.grey[500]),
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownFieldWithLabel extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const DropdownFieldWithLabel({super.key, 
    required this.label,
    required this.controller,
  });

  @override
  _DropdownFieldWithLabelState createState() => _DropdownFieldWithLabelState();
}

class _DropdownFieldWithLabelState extends State<DropdownFieldWithLabel> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: GoogleFonts.poppins(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5.0),
          DropdownButtonFormField<String>(
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue;
                widget.controller.text = newValue!;
              });
            },
            items: <String>[
              'Serum',
              'Face Wash',
              'Toner',
              'Moisturizer',
              'Sunscreen'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: 'Select ${widget.label}',
              hintStyle: TextStyle(color: Colors.grey[500]),
            ),
          ),
        ],
      ),
    );
  }
}
