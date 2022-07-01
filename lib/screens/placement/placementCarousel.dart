import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gehu/constants.dart';

class PlacementCarousel extends StatelessWidget {
  const PlacementCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Text(
              'Top Placement',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

          ],
        ),
        SizedBox(
          height: 400.0,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Placements")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      String img = snapshot.data!.docs[index]["img"];
                      Size size = MediaQuery.of(context).size;
                      String id = snapshot.data!.docs[index].id;
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  img,
                                  width: size.width * .8,
                                  height: size.height * .25,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          if (prefs.getBool('isAdmin') ?? false)
                            Delete(FirebaseFirestore.instance
                                .collection("Placement")
                                .doc(id)),
                        ],
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ],
    );
  }
}
