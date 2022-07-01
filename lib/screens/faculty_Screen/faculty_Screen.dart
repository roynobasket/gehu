import 'package:flutter/material.dart';
import 'package:gehu/screens/faculty_Screen/facultyCarousel.dart';



class faculty_Screen extends StatefulWidget {
  const faculty_Screen({Key? key}) : super(key: key);

  @override
  _faculty_ScreenState createState() => _faculty_ScreenState();
}

class _faculty_ScreenState extends State<faculty_Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Placement")),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          children:  const <Widget>[
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
            facultyCarousel(),

            // SizedBox(height: 20.0),
            // HotelCarousel(),
          ],
        ),
      ),

    );
  }
}
