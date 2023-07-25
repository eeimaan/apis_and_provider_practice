import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'text_provider.dart';

class PageSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<TextProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Displaying Text from Page 1: ${textProvider.displayText}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back to Page 1'),
            ),
          ],
        ),
      ),
    );
  }
}
