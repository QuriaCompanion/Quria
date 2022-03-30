import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/components/burger.dart';

class ScaffoldSteps<T> extends StatelessWidget {
  final Widget body;
  final String route;
  final T arguments;
  const ScaffoldSteps(
      {required this.body,
      required this.route,
      required this.arguments,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Burger(),
      extendBodyBehindAppBar: true,
      backgroundColor: black,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            alignment: Alignment.center,
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(globalPadding(context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              backgroundColor: blackLight,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(200, 50),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  )),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, route, arguments: arguments);
                },
                child: textBodyBold('Suivant', color: black)),
          ],
        ),
      ),
      body: Container(
        decoration: ghostBackground,
        child: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }
}
