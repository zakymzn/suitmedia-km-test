import 'package:flutter/material.dart';
import 'package:suitmedia_km_test/page3.dart';

class Page2 extends StatelessWidget {
  static const route = '/page_2';

  final String name;
  final String? selectedUserName;

  const Page2({super.key, required this.name, required this.selectedUserName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Second Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome'),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: selectedUserName != null
                  ? Text(
                      selectedUserName!,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const Text(
                      'Selected User Name',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Page3.route, arguments: name);
          },
          child: const Text('Choose a User'),
        ),
      ),
    );
  }
}
