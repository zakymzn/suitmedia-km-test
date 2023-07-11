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
      body: Container(
        child: ListView(
          children: [
            Text('Welcome'),
            Text(name),
            Center(
              child: Text('Selected User Name'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Page3(),
                  ),
                );
              },
              child: Text('Choose a User'),
            ),
          ],
        ),
      ),
    );
  }
}
