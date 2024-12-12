import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _State();
}

class _State extends State<Addpage> {
  String newWord = "";

  Future _addFierbaseData() async{
    await FirebaseFirestore.instance.collection("posts").add({
      "name": "Flutter",
      "text": newWord,
      "createdAt": DateTime.now(),
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(onChanged: (value) {
                      newWord = value;
            },),
          ElevatedButton(
            onPressed: () {
              //Firebaseに値を追加
              _addFierbaseData();
              Navigator.pop(context);
            },
            child: const Text("追加"),)
        ],
      ),
    );
  }
}
