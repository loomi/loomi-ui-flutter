import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:loomi_ui_flutter/loomi_ui.dart';

import 'package:example/screens/example_screen.dart';
import 'package:example/screens/story-book/story_book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loomi UI Story Book and Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Loomi UI Story Book and Examples'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CustomButton(
              text: 'Example Screen',
              borderRadius: 16,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 8,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ExampleScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Visibility(
            visible: kIsWeb,
            child: Center(
              child: CustomButton(
                text: 'Open StoryBook',
                borderRadius: 16,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 8,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const StoryBook(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
