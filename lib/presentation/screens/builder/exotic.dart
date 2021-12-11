import 'package:flutter/material.dart';

class ExoticWidget extends StatelessWidget {
  const ExoticWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return exotic(context);
  }

  Widget exotic(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.green,
      ),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 80.0),
                    child: Text(
                      "Veuillez choisir un éxotique",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 30,
                      child: Padding(
                        padding: EdgeInsets.only(left: 60.0),
                        child: Text(
                            "Prêt à construire votre armure de rêve?\nÇa commence maintenant!\nCommencez par choisir une armure exotique qui sera la pièrce maitresse de votre équipement.",
                            style: TextStyle(fontSize: 25)),
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.black54,
                      thickness: 1.5,
                      width: 20,
                    ),
                    Expanded(
                        child: Container(
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  color: Colors.grey,
                                  child: Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          "https://www.bungie.net/common/destiny2_content/icons/7dda3e71787fa4ad24cfb4da6473699f.jpg",
                                          fit: BoxFit.fitWidth,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Flexible(
                                              child: Text("Casque sur la tête",
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  color: Colors.grey,
                                  child: Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Image.network(
                                            "https://www.bungie.net/common/destiny2_content/icons/7dda3e71787fa4ad24cfb4da6473699f.jpg"),
                                        const Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Flexible(
                                              child: Text("Casque sur la tête",
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  color: Colors.grey,
                                  child: Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Image.network(
                                            "https://www.bungie.net/common/destiny2_content/icons/7dda3e71787fa4ad24cfb4da6473699f.jpg"),
                                        const Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Flexible(
                                              child: Text("Casque sur la tête",
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  color: Colors.grey,
                                  child: Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Image.network(
                                            "https://www.bungie.net/common/destiny2_content/icons/7dda3e71787fa4ad24cfb4da6473699f.jpg"),
                                        const Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Flexible(
                                              child: Text("Casque sur la tête",
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  color: Colors.grey,
                                  child: Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Image.network(
                                            "https://www.bungie.net/common/destiny2_content/icons/7dda3e71787fa4ad24cfb4da6473699f.jpg"),
                                        const Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Flexible(
                                              child: Text("Casque sur la tête",
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  color: Colors.grey,
                                  child: Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Image.network(
                                            "https://www.bungie.net/common/destiny2_content/icons/7dda3e71787fa4ad24cfb4da6473699f.jpg"),
                                        const Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Flexible(
                                              child: Text("Casque sur la tête",
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                        ),
                        flex: 60),
                  ],
                ),
              )
            ],
          ),
          padding: const EdgeInsets.all(80),
        ),
      ),
    );
  }
}


// https://www.bungie.net/common/destiny2_content/icons/8c7681f1e93ee996a724e55554e079e9.jpg