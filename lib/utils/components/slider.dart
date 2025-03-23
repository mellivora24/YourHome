// Slider widget
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
    required this.title,
    required this.width,
    required this.onChanged,
    required this.activeColor,
  });

  final activeColor;
  final String title;
  final double width;
  final ValueChanged<double> onChanged;

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Slider(
                  value: _value,
                  activeColor: widget.activeColor,
                  inactiveColor: Colors.white,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: _value.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                    widget.onChanged(value);
                  },
                ),
              ),
              Text(
                _value.round().toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}