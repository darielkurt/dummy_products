import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set the overlay color
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
