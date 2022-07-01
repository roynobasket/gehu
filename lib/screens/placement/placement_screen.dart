import 'package:flutter/material.dart';
import 'package:gehu/widgets/MyDrawer.dart';
import 'placementCarousel.dart';

class PlacementScreen extends StatefulWidget {
  const PlacementScreen({Key? key}) : super(key: key);

  @override
  _PlacementScreenState createState() => _PlacementScreenState();
}

class _PlacementScreenState extends State<PlacementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Placement")),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'When Dreams Came into Reality',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            PlacementCarousel(),
            // SizedBox(height: 20.0),
            // HotelCarousel(),
          ],
        ),
      ),
    );
  }
}
