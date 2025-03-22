import 'package:flutter/material.dart';

import 'package:yourhome_web/utils/components/water_level.dart';
import 'package:yourhome_web/utils/components/custom_container.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WaterLevel(
                  waterLevel: 70.3,
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomContainer(
                      title: 'Water Usage:',
                      content: '34 m³',
                      width: 300,
                      height: 95,
                      backgroundColor: Colors.orange,
                    ),
                    const SizedBox(height: 13),
                    CustomContainer(
                      title: 'Electric Usage:',
                      content: '34 kWh',
                      width: 300,
                      height: 95,
                      backgroundColor: Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                CustomContainer(
                  title: 'Temperature:',
                  content: '24°C',
                  width: 300,
                  height: 200,
                  backgroundColor: Colors.red,
                ),
                const SizedBox(width: 16),
                CustomContainer(
                  title: 'Humidity:',
                  content: '70%',
                  width: 300,
                  height: 200,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}