import 'package:flutter/material.dart';

class DevicesWidget extends StatelessWidget {
  const DevicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height, // Full height
      color: Colors.green[100],
      child: const Center(
        child: Text(
          'Devices Management Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}