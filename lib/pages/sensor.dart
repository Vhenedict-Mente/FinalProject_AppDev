// ignore_for_file: prefer_const_constructors

import 'package:ecoguard/pages/home.dart';
import 'package:ecoguard/pages/supply.dart';
import 'package:ecoguard/pages/feeder.dart';
import 'package:ecoguard/pages/production.dart';
import 'package:ecoguard/pages/surveillance.dart';
import 'package:flutter/material.dart';
import 'notification.dart';
import 'profile.dart';
import 'sensor_card.dart';

class SensorPage extends StatelessWidget {
  const SensorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sensors',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(248, 252, 249, 111),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(248, 252, 249, 111),
              ),
              child: Text(
                'ECOGUARD',
                style: TextStyle(
                    color: Color.fromARGB(255, 55, 122, 38),
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _createDrawerItem(
              icon: Icons.home,
              text: 'HomePage',
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              fontWeight: FontWeight.bold,
            ),
            _createDrawerItem(
              icon: Icons.sensors,
              text: 'Sensor',
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SensorPage()));
              },
              fontWeight: FontWeight.bold,
            ),
            _createDrawerItem(
              icon: Icons.videocam,
              text: 'Surveillance',
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SurveillancePage()));
              },
              fontWeight: FontWeight.bold,
            ),
            _createDrawerItem(
              icon: Icons.fastfood,
              text: 'Feeder',
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FeederPage()));
              },
              fontWeight: FontWeight.bold,
            ),
            _createDrawerItem(
              icon: Icons.production_quantity_limits,
              text: 'Production',
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductionPage()));
              },
              fontWeight: FontWeight.bold,
            ),
            _createDrawerItem(
              icon: Icons.local_shipping,
              text: 'Supply',
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SupplyPage()));
              },
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SensorCard(
            environment: 'Growing House Environment',
            temperature: 30.0,
            humidity: 84.0,
            co2: 31.0,
            ammonia: 49.0,
          ),
          SensorCard(
            environment: 'Chicken Pen Environment',
            temperature: 30.0,
            humidity: 84.0,
            co2: 31.0,
            ammonia: 49.0,
          ),
          Container(
            height: 300,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(248, 48, 48, 48)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Graph Placeholder',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(248, 20, 20, 20),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(248, 236, 236, 236),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      GestureTapCallback? onTap,
      FontWeight? fontWeight}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
        ),
      ),
      onTap: onTap,
    );
  }
}
