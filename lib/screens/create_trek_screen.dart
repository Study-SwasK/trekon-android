import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreateTrekScreen extends StatefulWidget {
  const CreateTrekScreen({super.key});

  @override
  State<CreateTrekScreen> createState() => _CreateTrekScreenState();
}

class _CreateTrekScreenState extends State<CreateTrekScreen> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _distanceController = TextEditingController();
  final _durationController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoriesController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _createTrek() {
    if (_nameController.text.isEmpty ||
        _locationController.text.isEmpty ||
        _distanceController.text.isEmpty ||
        _durationController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _categoriesController.text.isEmpty ||
        _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields and select an image')),
      );
      return;
    }

    final newTrek = {
      'name': _nameController.text,
      'location': _locationController.text,
      'distance': _distanceController.text,
      'duration': _durationController.text,
      'rating': 4.0,
      'reviews': 0,
      'price': _priceController.text,
      'categories': _categoriesController.text,
      'image': _image!.path,
      'details': 'Newly created trek',
      'description': 'A fresh trekking adventure.',
      'members': '5',
      'difficulty': 'Moderate',
    };

    Navigator.pop(context, newTrek);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _distanceController.dispose();
    _durationController.dispose();
    _priceController.dispose();
    _categoriesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Trek'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[200],
                child: _image == null
                    ? const Center(child: Text('Tap to select image'))
                    : Image.file(_image!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Trek Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _distanceController,
              decoration: const InputDecoration(labelText: 'Distance'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _durationController,
              decoration: const InputDecoration(labelText: 'Duration'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _categoriesController,
              decoration: const InputDecoration(labelText: 'Categories'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createTrek,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.zero,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: const Text(
                  'Create Trek',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}