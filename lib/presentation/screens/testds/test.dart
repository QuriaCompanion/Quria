import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/models/StoreBuild.dart';
import 'package:quria/firebase/FirestoreHelper.dart';
import 'package:universal_html/html.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Builder').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        // inspect(streamSnapshot.data!.docs);
        if (streamSnapshot.hasData) {
          return ListView.builder(
              itemCount: streamSnapshot.data?.docs.length,
              itemBuilder: (ctx, index) {
                final StoreBuild build =
                    StoreBuild(streamSnapshot.data!.docs[index]);
                return Text(build.boots!);
              });
        } else {
          return Text('no data');
        }
      },
    ));
  }
}
