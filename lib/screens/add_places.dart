import 'package:flutter/material.dart';

class AddPlacesScreen extends StatelessWidget {
  const AddPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Form(
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
                maxLength: 50,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
