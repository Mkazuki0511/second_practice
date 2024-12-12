import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:second/post.dart';

class Updatepage extends StatefulWidget {
  const Updatepage(this.post,{super.key});

  final Post post;

  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  String updatedWord = "";

  Future _updateFierbaseData() async {
    await FirebaseFirestore.instance
        .collection("posts")
        .doc(widget.post.id)
        .update({
      "name": "Flutter",
      "text": updatedWord,
      "updatedAt": DateTime.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("update"),
      ),
      body: Column(
        children: [
          TextFormField(
            initialValue: widget.post.text,
            onChanged: (value) {
            updatedWord = value;
            setState(() {

            });
          },
          ),
          ElevatedButton(
            onPressed: updatedWord.isEmpty ? null : () {
              //Firebaseに値を追加
              _updateFierbaseData();
              Navigator.pop(context);
            },
            child: const Text("更新"),
          ),
        ],
      ),
    );
  }
}
