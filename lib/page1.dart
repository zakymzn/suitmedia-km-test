import 'package:flutter/material.dart';
import 'package:suitmedia_km_test/page2.dart';
import 'package:suitmedia_km_test/utility/multi_argument.dart';

class Page1 extends StatefulWidget {
  static const route = '/page_1';

  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController palindromeController = TextEditingController();

  String reverseText(String input) {
    var chars = input.split('');
    return chars.reversed.join();
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    palindromeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: palindromeController,
                decoration: const InputDecoration(hintText: 'Palindrome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (palindromeController.text
                                                .toLowerCase() !=
                                            reverseText(palindromeController
                                                .text
                                                .toLowerCase())) {
                                          return const Text('Not Palindrome');
                                        } else {
                                          return const Text('Is Palindrome');
                                        }
                                      },
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('CHECK'),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, Page2.route,
                              arguments:
                                  MultiArgument(nameController.text, null));
                        }
                      },
                      child: const Text('NEXT'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
