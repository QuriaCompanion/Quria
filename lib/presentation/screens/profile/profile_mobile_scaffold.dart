import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/presentation/components/Header/mobile_components/mobile_character_choice.dart';
import 'package:quria/presentation/components/burger.dart';
import 'package:quria/presentation/screens/profile/profile_mobile_view.dart';

class ProfileMobileScaffold extends StatefulWidget {
  final ProfileHelper data;
  final Function(int) onCharacterChange;
  const ProfileMobileScaffold(
      {required this.data, required this.onCharacterChange, Key? key})
      : super(key: key);

  @override
  State<ProfileMobileScaffold> createState() => _ProfileMobileScaffoldState();
}

class _ProfileMobileScaffoldState extends State<ProfileMobileScaffold> {
  bool choosingCharacter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Burger(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              top: (56 - (vw(context) * 0.064)) / 2,
            ),
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        toolbarHeight: choosingCharacter ? 130 : 56,
        backgroundColor: Colors.transparent,
        flexibleSpace: MobileCharacterChoice(
            callback: (newIndex) {
              setState(() {
                widget.onCharacterChange(newIndex);
                choosingCharacter = !choosingCharacter;
              });
            },
            choosingCharacter: () {
              setState(() {
                choosingCharacter = !choosingCharacter;
              });
            },
            index: widget.data.selectedCharacterIndex,
            characters: widget.data.characters),
      ),
      body: Container(
        decoration: ghostBackground,
        child: SingleChildScrollView(
          child: ProfileMobileView(data: widget.data),
        ),
      ),
    );
  }
}
