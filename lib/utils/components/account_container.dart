import 'package:flutter/material.dart';

class AccountContainer extends StatelessWidget {
  final String name;
  final String phone;
  final String deviceId;
  final String avatarUrl;

  const AccountContainer({
    super.key,
    required this.name,
    required this.phone,
    required this.deviceId,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      // color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(phone, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 5),
          Text('ID: $deviceId', style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}