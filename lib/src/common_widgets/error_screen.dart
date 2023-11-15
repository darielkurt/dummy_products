import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({this.onRetry, super.key});
  final Function? onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 60.0,
              color: Colors.red,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Something Went Wrong',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'We apologize for the inconvenience. Please try again later.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                onRetry?.call();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
