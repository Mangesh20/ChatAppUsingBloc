import 'package:flutter/material.dart';

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ActivityIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      ///  showing CircularProgressIndicator
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
