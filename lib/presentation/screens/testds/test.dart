import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/models/StoreBuild.model.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/firebase/firestore_builder.dart';
import 'package:quria/presentation/components/misc/loader.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late Future<String?> _future;
  @override
  void initState() {
    super.initState();
    _future = AccountService().getCurrentMembershipId();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.hasData) {
            return StreamBuilder(
                stream: FirestoreBuilder().list(snapshot.data),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                        itemCount: streamSnapshot.data?.docs.length,
                        itemBuilder: (ctx, index) {
                          final StoreBuild build =
                              StoreBuild(streamSnapshot.data!.docs[index]);
                          return Text(build.boots.hash.toString());
                        });
                  } else {
                    return Text('no data');
                  }
                });
          } else {
            return const Loader();
          }
        });
  }
}
