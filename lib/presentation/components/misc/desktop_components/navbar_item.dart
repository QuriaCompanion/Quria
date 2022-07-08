import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:simple_animations/simple_animations.dart';

class NavBarButton extends StatefulWidget {
  final String name;
  final String icon;
  final String route;
  final bool selected;
  const NavBarButton({
    required this.name,
    required this.icon,
    required this.route,
    required this.selected,
    Key? key,
  }) : super(key: key);

  @override
  State<NavBarButton> createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> with AnimationMixin {
  late AnimationController colorController;
  late Animation<Color?> color;
  @override
  void initState() {
    super.initState();
    colorController = createController()..mirror(duration: const Duration(milliseconds: 250));
    color = ColorTween(begin: Colors.white, end: yellow).animate(colorController);
    colorController.stop();
  }

  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: InkWell(
        onTap: () => Navigator.pushReplacementNamed(context, widget.route),
        onHover: (_) {
          _isHover ? colorController.reverse() : colorController.forward();

          setState(() {
            _isHover = !_isHover;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(widget.icon, color: widget.selected ? yellow : color.value),
                const SizedBox(width: 5),
                textBodyBold(widget.name, color: widget.selected ? yellow : color.value),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
