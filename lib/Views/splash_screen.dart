import 'dart:async';

import 'package:flutter/material.dart';
import 'package:im_animations/im_animations.dart';
import 'package:loan_calculator_app/Components/colors.dart';
import 'package:loan_calculator_app/Views/loan_cal_view.dart';
import 'package:page_transition/page_transition.dart';

class LoanCalculatorSplashScreen extends StatefulWidget {
  const LoanCalculatorSplashScreen({super.key});

  @override
  State<LoanCalculatorSplashScreen> createState() =>
      _LoanCalculatorSplashScreenState();
}

class _LoanCalculatorSplashScreenState
    extends State<LoanCalculatorSplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            PageTransition(
                duration: const Duration(milliseconds: 700),
                isIos: true,
                child: const LoanCalculator(),
                type: PageTransitionType.fade)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonColor,
      body: Center(
        child: Rotate(
          repeat: true,
          child: const Icon(
            Icons.calculate,
            color: Colors.white,
            size: 120,
          ),
        ),
      ),
    );
  }
}
