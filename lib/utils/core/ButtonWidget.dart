import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final String label;
  final String iconPath;
  final double width, height;
  final VoidCallback onPressed;
  const ButtonWidget({
    super.key,
    required this.label,
    required this.color,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconPath != "" ? Image.asset(iconPath, width: 24) : Container(),
          SizedBox(width: iconPath != "" ? 10 : 0),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      )
    );
  }
}