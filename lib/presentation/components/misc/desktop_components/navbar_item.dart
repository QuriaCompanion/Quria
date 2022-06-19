import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quria/constants/texts.dart';

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

class _NavBarButtonState extends State<NavBarButton> {
  @override
  void initState() {
    super.initState();
  }

  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: InkWell(
        onTap: () => Navigator.pushReplacementNamed(context, widget.route),
        onHover: (val) {
          setState(() {
            isHover = !isHover;
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
                SvgPicture.asset(widget.icon),
                const SizedBox(width: 5),
                textBodyBold(widget.name)
              ],
            ),
            if (widget.selected)
              LinearPercentIndicator(
                percent: 1,
                progressColor: Colors.white,
                backgroundColor: Colors.white,
                lineHeight: 3,
                padding: EdgeInsets.zero,
                width: 150,
              ),
            if (!widget.selected)
              LinearPercentIndicator(
                animationDuration: 250,
                percent: isHover ? 1 : 0,
                animation: true,
                animateFromLastPercent: true,
                progressColor: Colors.white,
                lineHeight: 3,
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                width: 150,
              ),
          ],
        ),
      ),
    );
  }
}
