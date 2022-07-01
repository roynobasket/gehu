import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var prefs;

class Edit extends StatelessWidget {
  Edit({Key? key}) : super(key: key);

  final TextEditingController _state = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _url = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _name = TextEditingController();
  CollectionReference campuses = FirebaseFirestore.instance.collection('Campuses');

  @override
  Widget build(BuildContext context) {

    Future<void> addCampus() {

      return campuses
          .add({
          'city':_city.text,
          'desc':_desc.text,
          'name':_name.text,
          'state':_state.text,
          'url':_url.text,
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
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
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: Wrap(
                    children:  [
                      TextField(decoration: const InputDecoration(hintText: "City"),controller: _city,),
                      TextField(decoration: const InputDecoration(hintText: "State"),controller: _state,),
                      TextField(decoration: const InputDecoration(hintText: "Image URL"),controller: _url,),
                      TextField(decoration: const InputDecoration(hintText: "name"),controller: _name,),
                      TextField(decoration: const InputDecoration(hintText: "desc"),controller: _desc,),
                      ElevatedButton(child: const Text("Submit"),onPressed: (){
                        addCampus();
                      }),
                      const SizedBox(height: 8000)
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}





class Delete extends StatelessWidget {
  DocumentReference doc;
  Delete(this.doc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.delete_forever,
            size: 25,
          ),
          onPressed: () {
            doc.delete();
          },
        ),
      ),
    );
  }
}