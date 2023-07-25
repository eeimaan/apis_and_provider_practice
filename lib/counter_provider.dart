import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
/* and notifying any listeners (widgets) that are currently listening to this provider using 
 * the notifyListeners() method.When this method is called and the text is updated,
 *  all the widgets that are listening to this provider (using Provider.of or Consumer widgets) 
 * will be rebuilt to reflect the updated value. */
