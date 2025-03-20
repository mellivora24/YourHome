import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height, // Full height
      color: Colors.red[100],
      child: const Center(
        child: Text(
          'Account Settings Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}