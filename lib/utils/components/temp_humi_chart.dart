import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TemperatureAndHumidityChart extends StatefulWidget {
  const TemperatureAndHumidityChart({
    super.key,
    required this.width,
    required this.height,
    required this.temperatureData,
    required this.humidityData
  });

  final double width, height;
  final List<double> temperatureData;
  final List<double> humidityData;

  @override
  _TemperatureAndHumidityChartState createState() => _TemperatureAndHumidityChartState();
}

class _TemperatureAndHumidityChartState extends State<TemperatureAndHumidityChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Temperature & Humidity chart',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: widget.width,
            height: widget.height,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                            value.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            )
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                            value.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            )
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    left: BorderSide(color: Colors.white, width: 2),
                    bottom: BorderSide(color: Colors.white, width: 2),
                    right: BorderSide.none,
                    top: BorderSide.none,
                  )
                ),
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (List<LineBarSpot> touchedSpots) {
                      return touchedSpots.map((spot) {
                        final text = spot.y.toStringAsFixed(1);
                        return LineTooltipItem(
                          '$text\n(x: ${spot.x.toInt()})',
                          TextStyle(color: Colors.white, fontSize: 12),
                        );
                      }).toList();
                    },
                  ),
                  handleBuiltInTouches: true,
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: widget.temperatureData.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
                    isCurved: false,
                    color: Color(0xFF32ADE6),
                    barWidth: 2,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: false,
                    ),
                  ),
                  LineChartBarData(
                    spots: widget.humidityData.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
                    isCurved: false,
                    color: Color(0xFF00C7BE),
                    barWidth: 2,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: false,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}