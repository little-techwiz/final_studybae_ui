import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StreaksPage extends StatefulWidget {
  const StreaksPage({super.key});

  @override
  State<StreaksPage> createState() => _StreaksPageState();
}

class _StreaksPageState extends State<StreaksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streaks'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Streak Count
            const Text(
              '12',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
              ),
            ),

            const SizedBox(height: 20),

            // Monthly Progress Calendar
            Card(
              color: Colors.green[800],
              margin: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'JAN 2025',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Days of the Week
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('MON', style: TextStyle(color: Colors.white70)),
                      Text('TUE', style: TextStyle(color: Colors.white70)),
                      Text('WED', style: TextStyle(color: Colors.white70)),
                      Text('THU', style: TextStyle(color: Colors.white70)),
                      Text('FRI', style: TextStyle(color: Colors.white70)),
                      Text('SAT', style: TextStyle(color: Colors.white70)),
                      Text('SUN', style: TextStyle(color: Colors.white70)),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Progress Dots Grid
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: 35,
                      itemBuilder: (context, index) {
                        bool isFilled = index % 3 != 0; // Simulate filled progress
                        return CircleAvatar(
                          backgroundColor:
                          isFilled ? Colors.white : Colors.white30,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Weekly Progress Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your progress this week',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Line Chart
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 20,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                            return Text(
                              days[value.toInt() % days.length],
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                            );
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        color: Colors.greenAccent,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(show: false),
                        dotData: FlDotData(show: true),
                        spots: const [
                          FlSpot(0, 5),
                          FlSpot(1, 10),
                          FlSpot(2, 12),
                          FlSpot(3, 18),
                          FlSpot(4, 14),
                          FlSpot(5, 15),
                          FlSpot(6, 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}