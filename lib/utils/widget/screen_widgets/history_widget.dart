import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height, // Full height
      color: Colors.yellow[100],
      child: const Center(
        child: Text(
          'History & Logs Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}