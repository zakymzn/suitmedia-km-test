import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

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
        title: Text('Third Screen'),
      ),
      body: Container(
        child: ListView(
          children: [
            Text('Add Item List Here'),
          ],
        ),
      ),
    );
  }
}
