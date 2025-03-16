import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? label;
  final double? width;
  final double? height;
  final String? iconPath;
  final Color? textColor;
  final double? iconSize;
  final double? fontSize;
  final EdgeInsets? padding;
  final double? borderRadius;
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;

  const ButtonWidget({
    super.key,
    this.iconPath,
    this.onPressed,
    this.textColor,
    this.height = 50,
    this.width = 200,
    this.iconSize = 24.0,
    this.fontSize = 16.0,
    this.label = "Button",
    this.borderRadius = 8.0,
    this.backgroundColor = Colors.blue,
    this.fontWeight = FontWeight.normal,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? Colors.blue;
    final effectiveTextColor = textColor ?? _getContrastColor(effectiveBackgroundColor);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: effectiveBackgroundColor,
        foregroundColor: effectiveTextColor,
        fixedSize: Size(width ?? 200, height ?? 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        padding: padding,
        elevation: 2,
        shadowColor: effectiveBackgroundColor.withOpacity(0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPath != null && iconPath!.isNotEmpty) ...[
            Image.asset(
              iconPath!,
              width: iconSize,
              height: iconSize,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.error,
                size: iconSize,
                color: effectiveTextColor,
              ),
            ),
            SizedBox(width: 10),
          ],
          Text(
            label ?? "Button",
            style: TextStyle(
              fontSize: fontSize,
              color: effectiveTextColor,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }

  Color _getContrastColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}