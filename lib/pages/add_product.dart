import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:rekomendasi/pages/my_button.dart';

class AddProductForm extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController posController = TextEditingController();
  final Function(String) onProductAdded;

  AddProductForm({Key? key, required this.onProductAdded}) : super(key: key);

  Future<void> addProduct(BuildContext context) async {
    final int id = int.parse(idController.text);
    final String brand = brandController.text;
    final String name = nameController.text;
    final String image = imageController.text;
    final String category = categoryController.text;
    final int price = int.parse(priceController.text);
    final double rating = double.parse(ratingController.text);
    final String desc = descController.text;
    final String pos = posController.text;

    final Uri addProductUri = Uri.parse('http://10.0.2.2:5000/add_product');
    try {
      final response = await http.post(
        addProductUri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': id,
          'category': category,
          'brand': brand,
          'name': name,
          'image': image,
          'price': price,
          'rating': rating,
          'positif': pos,
          'desc': desc,
        }),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text(jsonData['message']),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    onProductAdded(
                        category); // Trigger the callback to refresh the Home Page
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to add product: ${response.reasonPhrase}'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred: $e'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

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
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold, // Set the fontWeight to bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFieldWithLabel(label: 'ID', controller: idController),
              DropdownFieldWithLabel(
                label: 'Category',
                controller: categoryController,
              ),
              TextFieldWithLabel(label: 'Brand', controller: brandController),
              TextFieldWithLabel(label: 'Name', controller: nameController),
              TextFieldWithLabel(label: 'Image', controller: imageController),
              TextFieldWithLabel(label: 'Price', controller: priceController),
              TextFieldWithLabel(
                label: 'Rating',
                controller: ratingController,
              ),
              TextFieldWithLabel(
                label: 'Positif',
                controller: posController,
              ),
              TextFieldWithLabel(
                label: 'Description',
                controller: descController,
              ),
              const SizedBox(height: 5.0),
              MyButton(
                onTap: () => addProduct(context),
                text: 'Add Product',
                backColor: 0xff925857,
                textColor: 0xFFFFFFFF,
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

  const TextFieldWithLabel({
    Key? key,
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

  const DropdownFieldWithLabel({
    Key? key,
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
              'Facewash',
              'Toner',
              'Serum',
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
