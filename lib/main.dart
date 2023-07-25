import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/fetch_api_ui.dart';
import 'package:provider_practice/page_first.dart';
import 'package:provider_practice/text_provider.dart';

import 'counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
            create: (_) => CounterProvider()),
            ChangeNotifierProvider<TextProvider>(create: (_) => TextProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FetchData(),
      ),
    );
  }
}
