// ignore_for_file: prefer_const_constructors

import 'package:ecoguard/pages/sensor.dart';
import 'package:ecoguard/pages/supply.dart';
import 'package:ecoguard/pages/feeder.dart';
import 'package:ecoguard/pages/production.dart';
import 'package:ecoguard/pages/surveillance.dart';
import 'package:flutter/material.dart';
import 'notification.dart';
import 'profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ecoguard',
          style: TextStyle(
            color: Color.fromARGB(255, 51, 141, 33),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
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
                    MaterialPageRoute(builder: (context) => HomePage()));
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'WELCOME TO\nMONITORING AND\nCONTROLLING APP',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 55, 122, 38)),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(248, 252, 249, 111),
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
