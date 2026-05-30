import 'dart:async';
import 'package:flutter/material.dart';
import 'package:labradio/app/styles/styles.dart';
import 'package:labradio/core/core.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _pageSetup);
  }

  Future<void> _pageSetup() async {
    final navigator = Navigator.of(context);
    Future.delayed(const Duration(seconds: 2), () {
      navigator.pushReplacementNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: HeaderText('Lab Radio')));
  }
}
