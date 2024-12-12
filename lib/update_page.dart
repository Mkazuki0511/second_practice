import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:second/post.dart';

class updatepage extends StatefulWidget {
  const updatepage(this.post,{super.key});

  final Post post;

  @override
  State<updatepage> createState() => _updatepageState();
}

class _updatepageState extends State<updatepage> {
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
            print(value);
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
            child: Text("更新"),
          ),
        ],
      ),
    );
  }
}
