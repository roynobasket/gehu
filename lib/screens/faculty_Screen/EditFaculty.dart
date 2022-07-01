import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditFaculty extends StatelessWidget {
  EditFaculty({Key? key}) : super(key: key);
  TextEditingController _desc = TextEditingController();
  TextEditingController _url = TextEditingController();
  CollectionReference faculty = FirebaseFirestore.instance.collection('faculty');

  Future<void> addfaculty() {
    return faculty
        .add({
      'img': _url.text, // John Doe
      'desc': _desc.text, // Stokes and Sons
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: IconButton(
        icon: const Icon(
          Icons.add,
          size: 25,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: Wrap(
                      children:  [
                        TextField(decoration: const InputDecoration(hintText: "Desc"),controller: _desc,),
                        TextField(decoration: const InputDecoration(hintText: "Image URL"),controller: _url,),
                        ElevatedButton(child: const Text("Submit"),onPressed: (){
                          addfaculty();
                          Navigator.pop(context);
                        }),
                        const SizedBox(height: 8000),
                      ],
                    ),
                  );
              });
        },
      ),
    );
  }
}