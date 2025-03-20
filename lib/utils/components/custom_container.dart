import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String? title;
  final String? content;
  final double? width;
  final double? height;
  final Color? textColor;
  final double? borderRadius;
  final Color? backgroundColor;

  const CustomContainer({
    super.key,
    this.title,
    this.content,
    this.width=100,
    this.height=200,
    this.borderRadius=8.0,
    this.textColor=Colors.white,
    this.backgroundColor=Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          // Content
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                content!,
                style: TextStyle(
                  color: textColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}