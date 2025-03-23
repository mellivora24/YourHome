import 'package:flutter/material.dart';

import 'package:yourhome_web/utils/components/slider.dart';
import 'package:yourhome_web/utils/components/water_level.dart';
import 'package:yourhome_web/utils/components/temp_humi_chart.dart';
import 'package:yourhome_web/utils/components/custom_container.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    super.key
  });

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WaterLevel(
                  width: screen_width * 0.8 / 4,
                  height: screen_height / 4,
                  waterLevel: 50,
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomContainer(
                      title: 'Water Usage:',
                      content: '34 m³',
                      width: screen_width * 0.8 / 4,
                      height: screen_height * 0.9 / 8,
                      backgroundColor: Color(0xFFFF7337),
                    ),
                    const SizedBox(height: 22),
                    CustomContainer(
                      title: 'Electric Usage:',
                      content: '34 kWh',
                      width: screen_width * 0.8 / 4,
                      height: screen_height * 0.9 / 8,
                      backgroundColor: Color(0xFF3C7FB6),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                CustomContainer(
                  title: 'Temperature:',
                  content: '24°C',
                  width: screen_width * 0.8 / 4,
                  height: screen_height / 4,
                  backgroundColor: Colors.cyan,
                ),
                const SizedBox(width: 16),
                CustomContainer(
                  title: 'Humidity:',
                  content: '70%',
                  width: screen_width * 0.8 / 4,
                  height: screen_height / 4,
                  backgroundColor: Color(0xFF3EB489),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TemperatureAndHumidityChart(
                  width: screen_width * 0.8 / 2 + 16,
                  height: screen_height * 0.9 / 4,
                  temperatureData: [24, 25, 26, 16, 28, 29, 19],
                  humidityData: [30, 80, 40, 73, 40, 50, 60],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SliderWidget(
                      title: 'Air conditioner control',
                      width: screen_width * 0.8 / 2 + 16,
                      activeColor: Color(0xFF3C7FB6),
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 16),
                    SliderWidget(
                      title: 'Fan speed control',
                      width: screen_width * 0.8 / 2 + 16,
                      activeColor: Color(0xFFFF7337),
                      onChanged: (value) {},
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}