import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable/loog_ev.dart';
import 'Sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _batteryHealth = 'Good';
  String _batteryAmperes = '50A';
  String _batteryVoltage = '120V';
  String _batteryCurrent = '20A';
  String _batteryTechnology = 'Lithium-ion';
  String _batteryMaxCapacity = '100 kWh';
  String _batteryTemperature = '30°C';
  String _evModel = 'Tesla Model S';
  String _evID = 'ABC123'; String _batteryPercentage = "98";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.battery_full, size: 80),
                SizedBox(width: 16),
                Column(
                  children: [
                    Text(
                      '$_batteryVoltage',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Current Voltage',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 32,
            thickness: 2,
            color: Colors.grey[400],
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      logoWidget("assets/images/EV_U_logo.png"),
                      Positioned(
                        bottom: 40,
                        child: Text(
                          '$_batteryPercentage%',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Battery Health:',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '$_batteryHealth',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Battery Amperes:',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '$_batteryAmperes',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Battery Voltage:',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '$_batteryVoltage',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Battery Current:',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '$_batteryCurrent',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                ],

              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            GestureDetector(
            onTap: () {
        // Navigate to user's profile screen
      },
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://www.w3schools.com/howto/img_avatar.png'),
                radius: 20,
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

Widget logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.scaleDown,
    width: double.infinity,
    height: 200,
    color: Colors.green,
  );
}
