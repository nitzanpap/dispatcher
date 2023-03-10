import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoublePaper extends StatefulWidget {
  final int currentStep;

  const DoublePaper({super.key, required this.currentStep});

  @override
  State<DoublePaper> createState() => _DoublePaperState();
}

class _DoublePaperState extends State<DoublePaper> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/papers/double_paper${widget.currentStep}.svg',
      semanticsLabel: 'Double Paper ${widget.currentStep} svg',
      placeholderBuilder: (context) =>
          Text('Double Paper ${widget.currentStep} svg'),
    );
  }
}
