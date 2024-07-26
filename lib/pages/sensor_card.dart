// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class SensorCard extends StatelessWidget {
  final String environment;
  final double temperature;
  final double humidity;
  final double co2;
  final double ammonia;

  SensorCard({super.key, 
    required this.environment,
    required this.temperature,
    required this.humidity,
    required this.co2,
    required this.ammonia,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Color.fromARGB(248, 252, 249, 111), // Use the appropriate color
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              environment,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SensorDataColumn(
                  icon: Icons.thermostat,
                  value: temperature,
                  unit: '°C',
                ),
                SensorDataColumn(
                  icon: Icons.water_drop,
                  value: humidity,
                  unit: '%',
                ),
                SensorDataColumn(
                  icon: Icons.science,
                  value: ammonia,
                  unit: 'ppm',
                ),
                SensorDataColumn(
                  icon: Icons.co2,
                  value: co2,
                  unit: 'ppm',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SensorDataColumn extends StatelessWidget {
  final IconData icon;
  final double value;
  final String unit;

  SensorDataColumn(
      {super.key, required this.icon, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Color.fromARGB(255, 79, 179, 54),
              width: 3,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$value',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  unit,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        Icon(icon, size: 30),
      ],
    );
  }
}
