import 'package:dispatcher/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../widgets/paper_widgets/double_paper.dart';

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
      if (currentStep + 1 <= introDescriptions.length - 1) {
        currentStep++;
      } else {
        // Implement this later.
        print('Finished Introduction!');
      }
    });
  }

  void skipIntro() {
    setState(() {
      currentStep = introDescriptions.length - 1;
    });
    moveToNextStep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Expanded(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  DoublePaper(currentStep: currentStep + 1),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => skipIntro(),
                          child: Row(
                            children: [
                              Text(
                                'Skip',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () => moveToNextStep(),
                          child: Row(
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
