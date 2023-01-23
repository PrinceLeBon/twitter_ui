import 'package:flutter/material.dart';

class IconUnderPost extends StatelessWidget {
  final IconData icondata;
  final String number;
  final String buttonType;
  final Color selectedColor;
  final Color defaultColor;
  final Function(bool) f;
  final bool action;
  final bool rt;
  final bool likePublication;

  const IconUnderPost(
      {Key? key,
      required this.icondata,
      required this.number,
      required this.buttonType,
      required this.selectedColor,
      required this.defaultColor,
      required this.f,
      required this.action,
      required this.rt,
      required this.likePublication})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        f(action);
      },
      splashColor: Colors.transparent,
      child: Row(
        children: [
          Icon(
              (buttonType == 'L' && likePublication)
                  ? Icons.favorite
                  : icondata,
              color: (buttonType == 'R' && rt)
                  ? selectedColor
                  : (buttonType == 'L' && likePublication)
                      ? selectedColor
                      : defaultColor),
          Text(number,
              style: TextStyle(
                  color: (buttonType == 'R' && rt)
                      ? selectedColor
                      : (buttonType == 'L' && likePublication)
                          ? selectedColor
                          : defaultColor)),
        ],
      ),
    );
  }
}
