import 'package:flutter/material.dart';
import 'package:labradio/features/features.dart';

class StationListLoader extends StatelessWidget {
  const StationListLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) => StationLoader(),
    );
  }
}
