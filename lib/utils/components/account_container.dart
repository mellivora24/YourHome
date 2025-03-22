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
      width: MediaQuery.of(context).size.width * 0.15,
      padding: const EdgeInsets.all(16),
      // color: Colors.grey[300],
      child: (MediaQuery.of(context).size.width > 1800) ? Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: $name',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Phone: $phone',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Device ID: $deviceId',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ) :
      Column(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(height: 10),
          Text(
            'Name: $name',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Phone: $phone',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Device ID: $deviceId',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}