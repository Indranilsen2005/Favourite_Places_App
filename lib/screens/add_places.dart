import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favourite_places/widgets/image_input.dart';
import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/widgets/location_input.dart';

class AddPlacesScreen extends ConsumerStatefulWidget {
  const AddPlacesScreen({super.key});

  @override
  ConsumerState<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends ConsumerState<AddPlacesScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _addPlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty || _pickedImage == null) {
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(
          enteredTitle,
          _pickedImage!,
        );

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Form(
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
                maxLength: 50,
                controller: _titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ImageInput(
              onPickImage: (image) {
                _pickedImage = image;
              },
            ),
            const SizedBox(height: 20),
            const LocationInput(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addPlace,
              child: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
