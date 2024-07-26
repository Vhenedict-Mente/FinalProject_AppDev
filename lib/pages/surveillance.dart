// ignore_for_file: prefer_const_constructors

import 'package:ecoguard/pages/home.dart';
import 'package:ecoguard/pages/sensor.dart';
import 'package:ecoguard/pages/feeder.dart';
import 'package:ecoguard/pages/production.dart';
import 'package:ecoguard/pages/supply.dart';
import 'package:flutter/material.dart';
import 'notification.dart';
import 'profile.dart';

class SurveillancePage extends StatelessWidget {
  const SurveillancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Surveillance',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.black),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()));
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage()));
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductionPage()));
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _cameraWidget('Camera 1', 'Growing House'),
              SizedBox(height: 20),
              _cameraWidget('Camera 2', 'Chicken Pen'),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(248, 236, 236, 236));
  }

  Widget _cameraWidget(String cameraTitle, String roomName) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.videocam, color: Colors.red),
                Text(
                  cameraTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Icon(Icons.videocam, color: Colors.red),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            height: 150,
            child: Center(
              child: Text(
                'Video Placeholder',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              roomName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
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
