import 'package:dispatcher/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final List introDescriptions = [
    'Welcome to Dispatcher, the right way to read your news. Just open the app.',
    'Search your fields of interest and the best part..',
    'Save all your articles for later, filter, learn and explore the latest news.',
  ];
  int currentStep = 0;

  void moveToNextStep() {
    setState(() {
      if (currentStep + 1 <= introDescriptions.length - 1) currentStep++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(
              width: 260,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: LinearProgressIndicator(
                      color: Theme.of(context).colorScheme.error,
                      value: (currentStep + 1) / introDescriptions.length,
                      backgroundColor: Colors.grey[800],
                      minHeight: 10,
                    ),
                  ),
                  const Gap(40),
                  Text(
                    appTitle,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  const Gap(40),
                  Text(
                    introDescriptions[currentStep],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => moveToNextStep(),
              child: Row(
                children: [
                  Text('Next'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
