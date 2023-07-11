import 'package:flutter/material.dart';
import 'package:suitmedia_km_test/page3.dart';

class Page2 extends StatelessWidget {
  final String name;

  const Page2({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Second Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome'),
          Text(name),
          Center(
            child: Text('Selected User Name'),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Page3(),
              ),
            );
          },
          child: Text('Choose a User'),
        ),
      ),
    );
  }
}
