import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/second_page.dart';
import 'package:provider_practice/text_provider.dart';

import 'counter_provider.dart';

class PageFirst extends StatelessWidget {
  PageFirst({super.key, required String title});
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(
      context,
    );
    final textProvider = Provider.of<TextProvider>(context);

/**final counterProvider = Provider.of<CounterProvider>(context, listen: true);
listen: true (Default Behavior):
When you set listen: true, the widget will listen to changes in the provider's data.
If the data in the provider changes (for example, when notifyListeners() is called), 
the widget will be rebuilt, and its UI will be updated to reflect the new data.
This is the typical behavior you want when your widget needs to be updated whenever the data changes.
final counterProvider = Provider.of<CounterProvider>(context, listen: false);
When you set listen: false, the widget will not listen to changes in the provider's data.
If the data in the provider changes, the widget will not be automatically rebuilt,
 and its UI will not update to reflect the new data.
This is useful when you want to read the provider data only once and don't want to
 rebuild the widget when the data changes. */

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value: ${counterProvider.counter}',
              style: TextStyle(
                  color:
                      counterProvider.counter >= 0 ? Colors.green : Colors.red),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: counterProvider.increment,
              child: Text('Increment'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: counterProvider.decrement,
              child: Text('Decrement'),
            ),
            const SizedBox(height: 20),
            Text('Current Text: ${textProvider.displayText}'),
            SizedBox(height: 20),
            /* ElevatedButton(
                log('.................' as num);
              onPressed: () {
                textProvider.changeText();
              },
              child: Text('Change Text'),
            ),*/
            Selector<TextProvider, VoidCallback>(
              selector: (context, textProvider) => textProvider.changeText,
              builder: (context, changeText, child) {
           
                return ElevatedButton(
                  
                  onPressed: changeText,
                  
                  child: Text('Change Text'),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PageSecond()),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
